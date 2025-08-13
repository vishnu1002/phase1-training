using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Testing_Paint
{
    public class Painter
    {
        private readonly IPaintTool _tool;

        public Painter(IPaintTool tool)
        {
            _tool = tool ?? throw new ArgumentNullException(nameof(tool));
        }

        public string Paint()
        {
            _tool.Use();
            return $"Painter is using {_tool.Name}";
        }
    }
}
