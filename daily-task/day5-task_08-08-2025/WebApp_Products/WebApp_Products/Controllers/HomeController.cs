using Microsoft.AspNetCore.Mvc;
using System;
using System.Diagnostics;
using WebApp_Products.Context;
using WebApp_Products.Models;

namespace WebApp_Products.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private AppDBContext AppDBContext { get; set; }

        public HomeController(ILogger<HomeController> logger, AppDBContext _appDBContext)
        {
            _logger = logger;
            AppDBContext = _appDBContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Product()
        {
            var allEmployees = AppDBContext.Product.ToList();
            return View(allEmployees);
        }

        public IActionResult EditProduct()
        {
            return View();
        }

        public IActionResult AddItem(ProductModel p)
        {
            AppDBContext.Product.Add(p);
            AppDBContext.SaveChanges();

            return RedirectToAction("Product");
        }

        public IActionResult DeleteRow(int Id)
        {
            var item = AppDBContext.Product.FirstOrDefault(p => p.Id == Id);
            if (item != null)
            {
                AppDBContext.Product.Remove(item);
                AppDBContext.SaveChanges();
            }

            return RedirectToAction("Product");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
