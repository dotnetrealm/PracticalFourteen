using PracticalFourteen.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PracticalFourteen.Domain.Interfaces
{
    public interface IEmployeeRepository
    {
        /// <summary>
        /// returns all employee
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<EmployeeModel>> GetAllEmployeesAsync();

        /// <summary>
        /// Get employee by id
        /// </summary>
        /// <param name="id">Employee Id</param>
        /// <returns></returns>
        Task<EmployeeModel> GetEmployeeByIdAsync(int id);

        /// <summary>
        /// Add new employee
        /// </summary>
        /// <param name="employee"></param>
        /// <returns></returns>
        Task<EmployeeModel> InsertEmployeeAsync(EmployeeModel employee);

        /// <summary>
        /// Update employee data
        /// </summary>
        /// <param name="id">Employee Id</param>
        /// <param name="employee">Updated employee object</param>
        /// <returns></returns>
        Task<bool> UpdateEmployeeAsync(int id, EmployeeModel employee);

        /// <summary>
        /// Delete employee by id
        /// </summary>
        /// <param name="id">Employee Id</param>
        /// <returns></returns>
        Task<bool> DeleteEmployeeAsync(int id);

        /// <summary>
        /// returns all employee whose name like given query
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<EmployeeModel>> SearchEmployeeByName(string name);
    }
}