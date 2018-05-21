
using NUnit.Framework;

namespace Battleship.Ascii.Tests
{
   using Battleship.GameController.Contracts;
    using Microsoft.VisualStudio.TestTools.UnitTesting;

    [TestClass]
    [TestFixture]
   public class ParsePositionTests
   {
      [TestMethod, Test]
      public void ParseLetterNumber()
      {
         var actual = Program.ParsePosition("A1");

         var expected = new Position(Letters.A, 1);

         Assert.AreEqual(expected, actual);
      }
   }
}
