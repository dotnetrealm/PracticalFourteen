using PracticalFourteen.Domain.Entities;
using System.Threading.Tasks;

namespace PracticalFourteen.Domain.Interfaces
{
    public interface IEmployeeRepository
    {
        /// <summary>
        /// returns employee by given page and query
        /// </summary>
        /// <param name="page">Page number</param>
        /// <param name="q">string that will find matches</param>
        /// <returns></returns>
        Task<PagedResult<EmployeeModel>> GetEmployeesAsync(int page, string q);

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
    }
}