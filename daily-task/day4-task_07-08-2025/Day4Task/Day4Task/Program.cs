using System;
using System.IO;
using System.Threading;

namespace Day4Task
{
    class Program
    {
        // Multithreading

        //static void Main()
        //{
        //    string path1 = @"D:\visual-studio\sample1.txt";
        //    string path2 = @"D:\visual-studio\sample2.txt";

        //    Thread t1 = new Thread(() => ReadFile(path1, "Thread 1"));
        //    Thread t2 = new Thread(() => ReadFile(path2, "Thread 2"));

        //    t1.Start();
        //    t2.Start();

        //    t1.Join();
        //    t2.Join();

        //    Console.WriteLine("Multithreaded file reading done.\n");
        //}

        //static void ReadFile(string filePath, string threadName)
        //{
        //    int threadId = Thread.CurrentThread.ManagedThreadId;
        //    string content = File.ReadAllText(filePath);
        //    Console.WriteLine($"Thread ID: [{threadId}] \n{content}\n");
        //}

        // Task using async/await

        static async Task Main()
        {
            string path1 = @"D:\visual-studio\sample1.txt";
            string path2 = @"D:\visual-studio\sample2.txt";

            Task<string> task1 = ReadFileAsync(path1, "Task 1");
            Task<string> task2 = ReadFileAsync(path2, "Task 2");

            string[] results = await Task.WhenAll(task1, task2);

            Console.WriteLine("Async file reading done.\n");
        }

        static async Task<string> ReadFileAsync(string filePath, string taskName)
        {
            string content = await File.ReadAllTextAsync(filePath);
            Console.WriteLine($"{taskName} read:\n{content}\n");
            return content;
        }
    }
}
