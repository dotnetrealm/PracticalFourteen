$(document).ready(() => {

    const noUserCheck = () => {
        if ($("#EmployeeDataTable tbody > tr").length == 0) {
            var data = "<tr id='NoUserFound'><td colspan='5' class='h4'><i class='fa fa-id-card'></i> Employee record not found</td></tr>";
            $("#EmployeeDataTable tbody").html(data);
        } else {
            $("#EmployeeDataTable tbody #NoUserFound").remove();
        }
    }

    //convert JSON date
    const parseJsonDate = (jsonDateString) => {
        var date = new Date(parseInt(jsonDateString.replace('/Date(', '')));
        var day = String(date.getDate()).padStart(2, '0');
        var month = String(date.getMonth()).padStart(2, '0');
        var year = date.getFullYear();
        return year + "-" + month + "-" + day;
    }

    const resetListners = () => {
        Array.from($(".viewEmployee")).forEach((ele) => {
            $(ele).on("click", (e) => viewEmployee(e))
        })

        Array.from($(".editEmployee")).forEach((ele) => {
            $(ele).on("click", (e) => editEmployee(e))
        })

        Array.from($(".deleteEmployee")).forEach((ele) => {
            $(ele).on("click", (e) => deleteEmployee(e))
        })
    }

    //generate toast message
    const makeToast = (message) => {
        var url = 'Toast/Index?message=' + encodeURIComponent(message); 
        $.get(url, (res) => {
            $("#ToastDisplay").html(res);
            $('.toast').toast('show');
        })
    }

    const createTableRow = (employee) => {
        return `<tr id="` + employee.Id + `">
                    <th scope="row">`+ employee.Id + `</th>
                                    <td>`+ employee.Name + `</td>
                            <td>`+ parseJsonDate(employee.DOB) + `</td>
                    <td>`+ (employee.Age) ? '-' : employee.Age + `</td>
                    <td>
                        <button class="btn btn-sm viewEmployee"><i class="fa fa-eye"></i></button>
                        <button class="btn btn-sm editEmployee"><i class="fa fa-user-pen"></i></button>
                        <button class="btn btn-sm deleteEmployee"><i class="fa fa-trash"></i></button>
                    </td>
                </tr>`
    }

    const viewEmployee = (event) => {
        var url = 'Employee/GetEmployeeById/' + event.target.closest("tr").id;
        $("#DisplaySection").load(url);
    };

    const editEmployee = (event) => {
        var id = event.target.closest("tr").id;
        $("#DisplaySection").load('Employee/Edit/' + id, () => {
            $("#EditEmployeeForm").on("submit", (e) => {
                e.preventDefault();
                $.ajax({
                    url: 'Employee/UpdateEmployee/' + id,
                    type: "post",
                    data: $("#EditEmployeeForm").serialize(),
                    success: (res) => {
                        console.log(res);
                        if (res.Result == "OK") {
                            var row = createTableRow(res.Data.employee);
                            console.log("#" + id);
                            $("#" + id).remove();

                            $("#EmployeeDataTable tbody").append(row);
                            $("#DisplaySection").empty();
                            resetListners();
                            makeToast("Employee updated successfully");
                        }
                        else {
                            $("#ValidationSummary").removeClass("d-none");
                            $("#ValidationSummary").text(res.Message);
                            //Generate toast
                            makeToast(res.Message);
                        }
                    },
                })
            })
        });
    }

    const deleteEmployee = (event) => {
        if (confirm('Are you sure you want to delete this?')) {
            var empId = event.target.closest("tr").id;
            var url = 'Employee/DeleteEmployee';
            $.ajax({
                url,
                type: "post",
                data: { id: empId },
                success: (res) => {
                    if (res.Result == "OK") {
                        $("#" + empId).remove();
                        $("#DisplaySection").empty();
                        makeToast("Employee deleted successfully");
                        noUserCheck();
                    }
                },
            })
        }
    }

    //refresh table data from DB
    const reloadTable = async () => {
        $("#EmployeeData").load("Employee/GetAllEmployees", () => {

            $("#Search").on("keyup", (e) => {
                $("#EmployeeData").load("Employee/Search?q=" + encodeURIComponent(e.target.value), () => {
                    resetListners();
                });
            })
            resetListners();
            
        });
        makeToast("Employees loaded successfully.")
    }

    //onPageLoad events
    reloadTable();
    $("#CreateEmployee").on("click", (e) => {
        $("#DisplaySection").load("Employee/Create", () => {
            $("#CreateEmployeeForm").on("submit", (e) => {
                e.preventDefault();
                console.log("submitted");
                $.ajax({
                    url: "Employee/CreateEmployee",
                    type: "post",
                    data: $("#CreateEmployeeForm").serialize(),
                    success: (res) => {
                            console.log(res);
                        if (res.Result == "OK") {
                            var row = createTableRow(res.Data.employee);
                            $("#EmployeeDataTable tbody").append(row);
                            $("#DisplaySection").empty();
                            makeToast("Employee Created successfully");
                            noUserCheck();
                            resetListners();
                        }
                        else {
                            $("#ValidationSummary").removeClass("d-none");
                            $("#ValidationSummary").text(res.Message);
                            //Generate toast
                            makeToast(res.Message);
                        }
                    },
                })
            });
        });
    });


})