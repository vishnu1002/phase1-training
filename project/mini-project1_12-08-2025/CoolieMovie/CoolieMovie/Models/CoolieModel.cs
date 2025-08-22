using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CoolieMovie.Models
{
    public class CoolieModel
    {
        public int Id { get; set; }

        [Required, StringLength(50, MinimumLength = 5)]
        public string Name { get; set; }
        public string Gender { get; set; }
        
        [Required, Range(6, 60)]
        public int Age { get; set; }

        
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime DOB { get; set; }
    }
}
