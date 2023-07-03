using PracticalFourteen.Data.Repositories;
using PracticalFourteen.Domain.Entities;
using PracticalFourteen.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace PracticalFourteen.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly IEmployeeRepository _employeeRepository;
        public EmployeeController()
        {
            _employeeRepository = new EmployeeRepository();
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> GetAllEmployees()
        {
            IEnumerable<EmployeeModel> employees = await _employeeRepository.GetAllEmployeesAsync();
            return PartialView("_EmployeesTable", employees);
        }

        [HttpGet]
        public async Task<ActionResult> GetEmployeeById(int id)
        {
            EmployeeModel employee = await _employeeRepository.GetEmployeeByIdAsync(id);
            return PartialView("_EmployeeDetails", employee);
        }

        [HttpGet]
        public async Task<ActionResult> Edit(int id)
        {
            EmployeeModel employee = await _employeeRepository.GetEmployeeByIdAsync(id);
            return PartialView("_Edit", employee);
        }

        [HttpGet]
        public async Task<ActionResult> Create()
        {
            return PartialView("_Create", new EmployeeModel());
        }

        [HttpPost]
        public async Task<JsonResult> CreateEmployee([Bind(Include = "Name, DOB, Age")] EmployeeModel employee)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    string messages = string.Join("\n", ModelState.Values
                                        .SelectMany(x => x.Errors)
                                        .Select(x => x.ErrorMessage));
                    throw new Exception(messages);
                }

                EmployeeModel data = await _employeeRepository.InsertEmployeeAsync(employee);
                return Json(new { Result = "OK", Data = new { employee= data } });
            }
            catch (Exception ex)
            {
                return Json(new { Result = "ERROR", ex.Message });
            }
        }

        [HttpPost]
        public async Task<JsonResult> UpdateEmployee(int id, [Bind(Include = "Name, DOB, Age")] EmployeeModel employee)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    string messages = string.Join("\n", ModelState.Values
                                        .SelectMany(x => x.Errors)
                                        .Select(x => x.ErrorMessage));
                    throw new Exception(messages);
                }

                var data = await _employeeRepository.UpdateEmployeeAsync(id, employee);
                employee.Id = id;
                return Json(new { Result = "OK", Data = new { employee } });
            }
            catch (Exception ex)
            {
                return Json(new { Result = "ERROR", Message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<JsonResult> DeleteEmployee(int id)
        {
            var data = await _employeeRepository.DeleteEmployeeAsync(id);
            if (data) return Json(new { Result = "OK" });
            else return Json(new { Result = "Error" });
        }

        [HttpGet]
        public async Task<PartialViewResult> search(string q)
        {
            IEnumerable<EmployeeModel> employees = await _employeeRepository.SearchEmployeeByName(q);
            return PartialView("_EmployeesTable", employees);
        }
    }
}