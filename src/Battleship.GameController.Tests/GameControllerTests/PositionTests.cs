using Battleship.GameController.Contracts;
using NUnit.Framework;
using Shouldly;

namespace Battleship.GameController.Tests.GameControllerTests
{
    [TestFixture]
    public class PositionTests
    {
        [Test]
        public void ShouldParsePositionCode()
        {
            var position = new Position("A3");
            position.Column.ShouldBe(Letters.A);
            position.Row.ShouldBe(3);
        }
    }
}