using CoolieMovie.Context;
using CoolieMovie.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Reflection;

namespace CoolieMovie.Controllers
{
    public class HomeController : Controller
    {
        List<CoolieModel> ListofMovies = new List<CoolieModel>();
        private AppDBContext AppDBContext { get; set; }

        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, AppDBContext _appDBContext)
        {
            ListofMovies.Add(new CoolieModel { Id = 1, Name = "sample", Gender = "Male", Age = 25 });
            _logger = logger;
            AppDBContext = _appDBContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        //public IActionResult Privacy()
        //{
        //    return View();
        //}

        public IActionResult BookTickets()
        {
            return View();
        }

        public IActionResult ViewBooking(string filter = null)
        {
            var data = AppDBContext.CoolieMovieDB.AsQueryable();

            switch (filter?.ToLower())
            {
                case "male":
                    data = data.Where(i => i.Gender.ToLower() == "male");
                    break;

                case "female":
                    data = data.Where(i => i.Gender.ToLower() == "female");
                    break;

                case "asc":
                    data = data.OrderBy(i => i.Name);
                    break;

                case "desc":
                    data = data.OrderByDescending(i => i.Name);
                    break;

                default:
                    break;
            }

            var totalBooking = AppDBContext.CoolieMovieDB.Count();
            var avgAge = Math.Round((double)AppDBContext.CoolieMovieDB.Average(i => i.Age));

            ViewBag.TotalBooking = totalBooking;
            ViewBag.AvgAge = avgAge;

            return View(data.ToList());
        }





        public IActionResult MoreDetails(int id)
        {
            var data = AppDBContext.CoolieMovieDB.FirstOrDefault(m => m.Id == id);
            if (data == null)
            {
                return NotFound();
            }
            return View(data);
        }

        public IActionResult AddData(CoolieModel data)
        {

            if (ModelState.IsValid)
            {
                if (data.Age <= 18)
                {
                    Console.WriteLine("Age should be greater than 18");
                    return RedirectToAction("Index");
                }

                AppDBContext.CoolieMovieDB.Add(data);
                AppDBContext.SaveChanges();

                return RedirectToAction("ViewBooking");
            }
            else
            {
                return View("BookTickets");
            }
        }

        public IActionResult DeleteData(int id)
        {
            var data = AppDBContext.CoolieMovieDB.FirstOrDefault(i => i.Id == id);
            if (data == null)
            {
                return NotFound();
            }

            AppDBContext.CoolieMovieDB.Remove(data);
            AppDBContext.SaveChanges();
            return RedirectToAction("ViewBooking");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
