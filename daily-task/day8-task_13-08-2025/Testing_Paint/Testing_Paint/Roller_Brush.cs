using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Testing_Paint
{
    public class Roller_Brush : IPaintTool
    {
        public string Name => "Paint Roller";
        public void Use() => Console.WriteLine("Painting with a roller...");
    }
}
