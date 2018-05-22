
using Battleship.GameController.Contracts;
using NUnit.Framework;

namespace Battleship.Ascii.Tests
{
   [TestFixture]
   public class ParsePositionTests
   {
      [Test]
      public void ParseLetterNumber()
      {
         var actual = GameController.GameController.ParsePosition("A1");

         var expected = new Position(Letters.A, 1);

         Assert.AreEqual(expected, actual);
      }
   }
}
