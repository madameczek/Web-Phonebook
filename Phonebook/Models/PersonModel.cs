using System;
using System.ComponentModel.DataAnnotations;

namespace Phonebook.Models
{
    public class PersonModel
    {
        public PersonModel() { }
        public PersonModel(int id) { Id = id; }

        [Key]
        [Display(Name = "ID")]
        public int Id { get; set; }

        [Display(Name = "Imię", Prompt ="Imię")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name ="Nazwisko", Prompt = "Nazwisko")]
        public string LastName { get; set; }

        [Display(Name = "Telefon", Prompt ="Telefon")]
        [Phone]
        public string Phone { get; set; }

        [EmailAddress]
        [Display(Name = "e-mail", Prompt ="Podaj ważny e-mail")]
        public string Email { get; set; }

        [Display(Name = "Utworzono")]
        [DisplayFormat(DataFormatString ="{0:yyyy-MM-dd HH:mm}")]
        [DataType(DataType.DateTime)]
        public DateTimeOffset Created { get; set; }

        [Display(Name = "Zaktualizowano")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm}", NullDisplayText ="nie aktualizowano")]
        public DateTimeOffset? Updated { get; set; }
    }
}
