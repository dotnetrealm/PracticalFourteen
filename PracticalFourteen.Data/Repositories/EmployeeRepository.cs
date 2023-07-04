using PracticalFourteen.Domain.Entities;
using PracticalFourteen.Domain.Interfaces;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace PracticalFourteen.Data.Repositories
{
    public class EmployeeRepository : IEmployeeRepository
    {
        readonly EmployeeDBFirstEntities _db;

        public EmployeeRepository()
        {
            _db = new EmployeeDBFirstEntities();
        }

        public async Task<PagedResult<EmployeeModel>> GetEmployeesAsync(int page, string q)
        {
            // Use the provided page number or default to 1
            int pageNumber = page;
            // Number of employees per page
            int pageSize = 10;
            var totalCount = await _db.Employees.CountAsync();
            List<EmployeeModel> employees = await _db.Employees.Where((e) => e.Name.Contains(q))
                                           .OrderBy(e => e.Id)
                                           .Skip((pageNumber - 1) * pageSize)
                                           .Take(pageSize).Select(emp => new EmployeeModel()
                                           {
                                               Id = emp.Id,
                                               Name = emp.Name,
                                               DOB = emp.DOB,
                                               Age = emp.Age
                                           }).ToListAsync();

            var pagedResult = new PagedResult<EmployeeModel>(employees, totalCount, pageNumber, pageSize);
            return pagedResult;
        }

        public async Task<EmployeeModel> GetEmployeeByIdAsync(int id)
        {
            var employee = await _db.Employees.Where(emp => emp.Id == id).Select(emp => new EmployeeModel()
            {
                Id = emp.Id,
                Name = emp.Name,
                DOB = emp.DOB,
                Age = emp.Age
            }).FirstAsync();
            return employee;
        }

        public async Task<EmployeeModel> InsertEmployeeAsync(EmployeeModel employee)
        {
            Employee emp = new Employee()
            {
                Name = employee.Name,
                DOB = employee.DOB,
                Age = employee.Age
            };

            emp = _db.Employees.Add(emp);
            await _db.SaveChangesAsync();

            EmployeeModel employeeModel = new EmployeeModel()
            {
                Id = emp.Id,
                Name = emp.Name,
                DOB = emp.DOB,
                Age = emp.Age
            };
            return employeeModel;
        }

        public async Task<bool> UpdateEmployeeAsync(int id, EmployeeModel employee)
        {
            var data = _db.Employees.FirstOrDefault(e => e.Id == id);

            if (data != null)
            {
                data.Name = employee.Name;
                data.DOB = employee.DOB;
                data.Age = employee.Age;
            }

            await _db.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteEmployeeAsync(int id)
        {
            var data = await _db.Employees.FirstOrDefaultAsync(e => e.Id == id);

            if (data == null) return false;

            _db.Employees.Remove(data);
            await _db.SaveChangesAsync();
            return true;
        }
    }
}
