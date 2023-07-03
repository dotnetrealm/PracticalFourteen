using System;
using System.ComponentModel.DataAnnotations;

namespace PracticalFourteen.Domain.Entities
{
    public class EmployeeModel
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Range(typeof(DateTime), "1800-01-01", "2022-12-31", ErrorMessage = "Please select valid Birthdate (1800/01/01 - 2022/12/31)")]
        public DateTime DOB { get; set; } = new DateTime(2000, 01, 01);

        [DisplayFormat(NullDisplayText = "-")]
        public int? Age { get; set; }
    }
}
