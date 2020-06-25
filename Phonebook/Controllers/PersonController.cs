using Microsoft.AspNetCore.Mvc;
using Phonebook.Models;
using System;
using System.Collections.Generic;

namespace Phonebook.Controllers
{
    public class PersonController : Controller
    {
        [HttpGet]
        public IActionResult Index(int page = 1)
        {
            int rowsPerPage = 15;
            List<PersonModel> people = new List<PersonModel>();
            try
            {
                List<PageButtonModel> pageButtons = new List<PageButtonModel>(); // Lista z przyciskami paginacji
                using SourceManager sourceManager = new SourceManager();
                int peopleCount = sourceManager.GetPeopleCount(); // Policz wszystkie rekordy
                int startRow = page == 1 ? 1 : (page - 1) * rowsPerPage + 1;
                people = sourceManager.Get(startRow, rowsPerPage, "%"); // Pobierz rekordy dla żądanej strony
                
                int pageCount = (int)Math.Ceiling(peopleCount / (double)rowsPerPage);
                for (int i = 1; i <= pageCount; ++i)
                {
                    pageButtons.Add(new PageButtonModel { PageNumber = i });
                }
                ViewBag.Pagination = pageButtons;
            }
            catch
            {
                TempData["Error"] = "Błąd bazy danych";
                return View("DataSourceErrorPage"); // wyświetl stronę błędu
            }
            // Żeby nie wyświetlać zbyt wielu kolumn, wyświetlana jest tylko data ostatniego zapisu rekordu
            // Jeśli brak daty aktualizacji => data aktualizacji = data utworzenia (tylko na potrzeby tego widoku)
            people.ForEach(p => { if (p.Updated == null) { p.Updated = p.Created; } });
            return View(people);
        }

        [HttpPost]
        public IActionResult Index(string lastName)
        {
            // W przypadku podania pustego stringu do wyszukiwania wróć do trybu wyświetlania 
            // wszystkich rekordów z paginacją
            if (string.IsNullOrEmpty(lastName)) { return RedirectToActionPermanent("Index", new { page = 1 }); }

            List<PersonModel> people = new List<PersonModel>();
            try
            {
                using SourceManager sourceManager = new SourceManager();
                lastName = string.IsNullOrWhiteSpace(lastName) ? "%" : lastName.Replace('*', '%');
                people = sourceManager.Get(1, int.MaxValue, lastName);
            }
            catch
            {
                TempData["Error"] = "Błąd bazy danych";
                return View("DataSourceErrorPage"); // wyświetl stronę błędu
            }
            // Żeby nie wyświetlać zbyt wielu kolumn, wyświetlana jest tylko data ostatniego zapisu rekordu
            // Jeśli brak daty aktualizacji => data aktualizacji = data utworzenia (tylko na potrzeby tego widoku)
            people.ForEach(p => { if (p.Updated == null) { p.Updated = p.Created; } });
            return View(people);
        }

        [HttpGet]
        public IActionResult Add() { return View(); }

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
                    TempData["Error"] = "Błąd bazy danych";
                    TempData["Status"] = "Operacja zakończona niepowodzeniem.";
                    return View("DataSourceErrorPage"); // wyświetl stronę błędu
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
                TempData["Error"] = "Błąd bazy danych.";
                return View("DataSourceErrorPage"); // wyświetl stronę błędu
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
                    TempData["Error"] = "Błąd bazy danych";
                    TempData["Status"] = "Operacja zakończona niepowodzeniem.";
                    return View("DataSourceErrorPage"); // wyświetl stronę błędu
                }
                TempData["Status"] = $"Zaktualizowano wpis.";
                ModelState.Clear();
                return RedirectToActionPermanent("Index");
            }
            return View(person);
        }

        [HttpGet]
        public IActionResult Details(int id)
        {
            PersonModel person = new PersonModel();
            try
            {
                using SourceManager sourceManager = new SourceManager();
                person = sourceManager.GetById(id); //odczyt z bazy
            }
            catch (Exception)
            {
                TempData["Error"] = "Błąd bazy danych.";
                return View("DataSourceErrorPage"); // wyświetl stronę błędu
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
                TempData["Error"] = "Błąd bazy danych.";
                return View("DataSourceErrorPage"); // wyświetl stronę błędu
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
                TempData["Error"] = "Błąd bazy danych";
                TempData["Status"] = "Operacja zakończona niepowodzeniem.";
                return View("DataSourceErrorPage"); // wyświetl stronę błędu
            }
            TempData["Status"] = $"Usunięto wpis.";
            return RedirectToActionPermanent("Index");
        }
    }
}
