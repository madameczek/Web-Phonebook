using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Phonebook.Models;

namespace Phonebook.Controllers
{
    public class PersonController : Controller
    {
        [HttpGet]
        public IActionResult Index(int page = 1)
        {
            List<PersonModel> people = new List<PersonModel>();
            try
            {
                using SourceManager sourceManager = new SourceManager();
                people = sourceManager.Get(1, 20, "%");
                // Żeby nie wyświetlać zbyt wielu kolumn, wyświetlana jest tylko data ostatniego zapisu rekordu
                // Jeśli brak daty aktualizacji => data aktualizacji = data utworzenia (tylko na potrzeby tego widoku)
                people.ForEach(p => { if (p.Updated == null) { p.Updated = p.Created; } });
            }
            catch
            {
                // wyświetl stronę błędu
                TempData["Error"] = "Błąd bazy danych";
                return View("DataSourceErrorPage");
            }
            // max 3 strony min 20 rekordów
            return View(people);
        }

        [HttpPost]
        public IActionResult Index(string lastName)
        {
            List<PersonModel> people = new List<PersonModel>();
            try
            {
                using SourceManager sourceManager = new SourceManager();
                lastName = string.IsNullOrWhiteSpace(lastName) ? "%" : lastName.Replace('*', '%');
                people = sourceManager.Get(1, 10, lastName);
            }
            catch
            {
                // wyświetl stronę błędu
                TempData["Error"] = "Błąd bazy danych";
                return View("DataSourceErrorPage");
            }
            people.ForEach(p => { if (p.Updated == null) { p.Updated = p.Created; } });
            return View(people);
        }

        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(PersonModel person)
        {
            if (ModelState.IsValid)
            {
                int id;
                try
                {
                    using SourceManager sourceManager = new SourceManager();
                    id = sourceManager.Add(person); //zapis do bazy
                }
                catch (Exception)
                {
                    // wyświetl stronę błędu
                    TempData["Error"] = "Błąd bazy danych";
                    TempData["Status"] = "Operacja zakończona niepowodzeniem.";
                    return View("DataSourceErrorPage");
                }
                TempData["Status"] = $"Dodano wpis o Id: {id}";
                ModelState.Clear();
                return View("Add");
            }
            return View(person);
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            PersonModel person = new PersonModel();
            try
            {
                using SourceManager sourceManager = new SourceManager();
                person = sourceManager.GetById(id); //odczyt z bazy
            }
            catch (Exception)
            {
                // wyświetl stronę błędu
                TempData["Error"] = "Błąd bazy danych.";
                return View("DataSourceErrorPage");
            }
            return View(person);
        }

        [HttpPost]
        public IActionResult Edit(PersonModel person)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    using SourceManager sourceManager = new SourceManager();
                    sourceManager.Update(person); //update bazy
                }
                catch (Exception)
                {
                    // wyświetl stronę błędu
                    TempData["Error"] = "Błąd bazy danych";
                    TempData["Status"] = "Operacja zakończona niepowodzeniem.";
                    return View("DataSourceErrorPage");
                }

                TempData["Status"] = $"Zaktualizowano wpis.";
                ModelState.Clear();
                return RedirectToActionPermanent("Index");
            }
            return View(person);
        }


        public IActionResult Details(int id)
        {
            // pobierz z bazy
            PersonModel person = new PersonModel();
            try
            {
                using SourceManager sourceManager = new SourceManager();
                person = sourceManager.GetById(id); //odczyt z bazy
            }
            catch (Exception)
            {
                // wyświetl stronę błędu
                TempData["Error"] = "Błąd bazy danych.";
                return View("DataSourceErrorPage");
            }
            return View(person);
        }

        [HttpGet]
        public IActionResult Remove(int id)
        {
            // pobierz z bazy i potwierdź usuwanie
            PersonModel person = new PersonModel();
            try
            {
                using SourceManager sourceManager = new SourceManager();
                person = sourceManager.GetById(id); //odczyt z bazy
            }
            catch (Exception)
            {
                // wyświetl stronę błędu
                TempData["Error"] = "Błąd bazy danych.";
                return View("DataSourceErrorPage");
            }
            return View(person);
        }

        [HttpPost]
        public IActionResult RemoveConfirmed(int id)
        {
            // usuń z bazy
            try
            {
                using SourceManager sourceManager = new SourceManager();
                sourceManager.Remove(id);
            }
            catch (Exception)
            {
                // wyświetl stronę błędu
                TempData["Error"] = "Błąd bazy danych";
                TempData["Status"] = "Operacja zakończona niepowodzeniem.";
                return View("DataSourceErrorPage");
            }
            TempData["Status"] = $"Usunięto wpis.";
            return RedirectToActionPermanent("Index");
        }
    }
}
