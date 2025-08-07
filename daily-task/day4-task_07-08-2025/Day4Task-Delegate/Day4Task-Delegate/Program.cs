namespace Day4Task_Delegate;

class Program
{
    static void Main()
    {
        Teacher teacher = new Teacher();

        // Pass Teacher's method as delegate
        Student student = new Student(teacher.TestCompleted);

        // Student writes the test and notifies the teacher
        student.WriteTest();

        Console.WriteLine("Process Ended");
    }
}