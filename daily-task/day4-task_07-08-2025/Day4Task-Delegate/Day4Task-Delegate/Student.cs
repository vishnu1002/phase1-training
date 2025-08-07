using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day4Task_Delegate
{
    public delegate void TestCompletedHandler();

    internal class Student
    {
        private TestCompletedHandler testCompletedDelegate;

        public Student(TestCompletedHandler testCompletedDelegate)
        {
            this.testCompletedDelegate = testCompletedDelegate;
        }

        public void WriteTest()
        {
            Console.WriteLine("Student: Writing the test...");
            Thread.Sleep(1000);
            Console.WriteLine("Student: Finished writing the test.");

            testCompletedDelegate();
        }
    }
}
