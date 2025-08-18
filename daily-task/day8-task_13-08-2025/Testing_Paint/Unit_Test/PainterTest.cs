using Testing_Paint;

namespace Unit_Test
{
    public class PainterTests
    {
        [SetUp]
        public void Setup()
        {
        }

        // pass
        [Test]
        public void Painter_UsesPaintBrush()
        {
            var brush = new Paint_Brush();
            var painter = new Painter(brush);
            Assert.AreEqual("Painter is using Paint Brush", painter.Paint());
        }

        // fail
        [Test]
        public void Painter_UsesRollerBrush()
        {
            var roller = new Roller_Brush();
            var painter = new Painter(roller);
            Assert.AreEqual("Painter is using Paint BRUSH", painter.Paint()); // wrong on purpose
        }

        // pass
        [Test]
        public void PaintBrush_Name_IsCorrect()
        {
            var brush = new Paint_Brush();
            Assert.AreEqual("Paint Brush", brush.Name);
        }

        // fail
        [Test]
        public void RollerBrush_Name_IsCorrect()
        {
            var roller = new Roller_Brush();
            Assert.AreEqual("Paint Brush", roller.Name); // wrong on purpose
        }

        // pass
        [Test]
        public void Painter_NullTool_ThrowsArgumentNullException()
        {
            Assert.Throws<ArgumentNullException>(() => new Painter(null));
        }

        // fail
        [Test]
        public void PaintBrush_Use_DoesNotThrow()
        {
            var brush = new Paint_Brush();
            Assert.Throws<Exception>(() => brush.Use()); // wrong on purpose
        }

        // pass
        [Test]
        public void RollerBrush_Use_DoesNotThrow()
        {
            var roller = new Roller_Brush();
            Assert.DoesNotThrow(() => roller.Use());
        }

        // fail
        [Test]
        public void Painter_WithBrush_OutputContainsBrush()
        {
            var painter = new Painter(new Paint_Brush());
            StringAssert.Contains("Roller", painter.Paint()); // wrong on purpose
        }

        // pass
        [Test]
        public void Painter_WithRoller_OutputContainsRoller()
        {
            var painter = new Painter(new Roller_Brush());
            StringAssert.Contains("Roller", painter.Paint());
        }

        // fail
        [Test]
        public void DifferentTools_ProduceDifferentOutputs()
        {
            var brushPainter = new Painter(new Paint_Brush());
            var rollerPainter = new Painter(new Roller_Brush());
            Assert.AreEqual(brushPainter.Paint(), rollerPainter.Paint()); // wrong on purpose
        }
    }
}