using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Testing_Paint
{
    public interface IPaintTool
    {
        public string Name { get; }
        void Use();
    }
}
