$(document).ready(() => {

    //On empty table add not found message
    const noUserCheck = () => {
        if ($("#EmployeeDataTable tbody > tr").length == 0) {
            let data = "<tr id='NoUserFound'><td colspan='5' class='h4'><i class='fa fa-id-card'></i> Employee record not found</td></tr>";
            $("#EmployeeDataTable tbody").html(data);
        } else {
            $("#EmployeeDataTable tbody #NoUserFound").remove();
        }
    }

    //Convert JSON(Date/'231132651156345'/) date to Date(yyyy-MM-dd) string
    const parseJsonDate = (jsonDateString) => {
        let date = new Date(parseInt(jsonDateString.replace('/Date(', '')));
        let day = String(date.getDate()).padStart(2, '0');
        let month = String(date.getMonth()).padStart(2, '0');
        return date.getFullYear() + "-" + month + "-" + day;
    }

    //Set events on view, edit & delete link of employee table data
    const setEventListners = () => {
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
        let url = 'Toast/Index?message=' + encodeURIComponent(message);
        $.get(url, (res) => {
            //display generated toast message
            $("#ToastDisplay").html(res);

            //show toast message
            $('.toast').toast('show');
        })
    }

    //create single table row 
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

    //Employee view event
    const viewEmployee = (event) => {
        let url = 'Employee/GetEmployeeById/' + event.target.closest("tr").id;
        $("#DisplaySection").load(url);
    };

    //Employee edit event 
    const editEmployee = (event) => {
        let id = event.target.closest("tr").id;

        //Load employee form in section
        $("#DisplaySection").load('Employee/Edit/' + id, () => {

            //After employee form loading add submit event listner
            $("#EditEmployeeForm").on("submit", (e) => {
                //prevent from reload the page
                e.preventDefault();

                //Employee update call
                $.ajax({
                    url: 'Employee/UpdateEmployee/' + id,
                    type: "post",
                    data: $("#EditEmployeeForm").serialize(),
                    success: (res) => {
                        if (res.Result == "OK") {
                            let row = createTableRow(res.Data.employee);
                            $("#" + id).remove();
                            $("#EmployeeDataTable tbody").append(row);

                            //Reset display section
                            $("#DisplaySection").empty();

                            //Reset event listner after appending new row to table
                            setEventListners();
                            makeToast("Employee updated successfully");
                        }
                        else {
                            $("#ValidationSummary").removeClass("d-none");
                            $("#ValidationSummary").text(res.Message);
                            makeToast(res.Message);
                        }
                    },
                })
            })
        });
    }

    //Employee delete event
    const deleteEmployee = (event) => {
        if (confirm('Are you sure you want to delete this?')) {
            let empId = event.target.closest("tr").id;
            $.ajax({
                url: "Employee/DeleteEmployee",
                type: "post",
                data: { id: empId },
                success: (res) => {
                    if (res.Result == "OK") {
                        $("#" + empId).remove();
                        $("#DisplaySection").empty();
                        makeToast("Employee deleted successfully");

                        //if last record deleted then display empty table message
                        noUserCheck();
                    }
                },
            })
        }
    }

    //Reload pagination button events
    const reloadPagination = () => {
        //on click of pagination links
        $(".PaginationBtn").on("click", (e) => {
            let page = $(e.target).data("page");
            let q = encodeURIComponent($("#Search").val());
            $.ajax({
                url: "Employee/GetEmployees",
                data: { q, page },
                success: (res) => {
                    $("#EmployeeData").html(res);
                    //reload event listners on pagination tabs
                    reloadPagination();
                    //set event listners for newly loaded data
                    setEventListners();
                }
            })
        })
    }

    //Reload table data from DB
    const reloadTable = async () => {
        $("#EmployeeData").load("Employee/GetEmployees", () => {
            reloadPagination();
            setEventListners();
            //Set search input keyup event listner
            $("#Search").on("keyup", (e) => {
                $.ajax({
                    url: "Employee/GetEmployees",
                    data: { q: encodeURIComponent(e.target.value), page: $("#ActivePage").data("page") },
                    success: (res) => {
                        $("#EmployeeData").html(res);
                        //reload event listners on pagination tabs
                        reloadPagination();
                        //set event listners for newly loaded data
                        setEventListners();
                        makeToast("Search result updated.");            
                    }
                })
            });
            makeToast("Employees loaded successfully.");
        })
    }

    //onPageLoad events
    reloadTable();

    //Create new employee button click handler
    $("#CreateEmployee").on("click", (e) => {
        $("#DisplaySection").load("Employee/Create", () => {
            $("#CreateEmployeeForm").on("submit", (e) => {
                e.preventDefault();
                $.ajax({
                    url: "Employee/CreateEmployee",
                    type: "post",
                    data: $("#CreateEmployeeForm").serialize(),
                    success: (res) => {
                        if (res.Result == "OK") {
                            let row = createTableRow(res.Data.employee);
                            $("#EmployeeDataTable tbody").append(row);
                            $("#DisplaySection").empty();
                            makeToast("Employee Created successfully");
                            noUserCheck();
                            setEventListners();
                        }
                        else {
                            $("#ValidationSummary").removeClass("d-none");
                            $("#ValidationSummary").text(res.Message);
                            makeToast(res.Message);
                        }
                    },
                })
            });
        });
    });

})