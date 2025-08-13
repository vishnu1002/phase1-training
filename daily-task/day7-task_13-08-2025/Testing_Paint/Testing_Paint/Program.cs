namespace Testing_Paint;

class Program
{
    static void Main()
    {
        IPaintTool brush = new Paint_Brush();
        Painter painter = new Painter(brush);
        Console.WriteLine(painter.Paint());

        IPaintTool roller = new Roller_Brush();
        Painter rollerPainter = new Painter(roller);
        Console.WriteLine(rollerPainter.Paint());
    }
}
