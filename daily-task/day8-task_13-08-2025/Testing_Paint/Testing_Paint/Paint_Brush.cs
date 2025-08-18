using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Testing_Paint
{
    public class Paint_Brush : IPaintTool
    {
        public string Name => "Paint Brush";
        public void Use() => Console.WriteLine("Painting with a brush...");
    }
}
