using Battleship.GameController.Contracts;
using NUnit.Framework;
using Shouldly;

namespace Battleship.GameController.Tests.GameControllerTests
{
    [TestFixture]
    public class CoordinateTests
    {
        [Test]
        public void ShouldParseCoordinateCode()
        {
            var coordinate = new Coordinate("A3");
            coordinate.Column.ShouldBe(Letters.A);
            coordinate.Row.ShouldBe(3);
        }

        [Test]
        public void ShouldConstructCoordinate()
        {
            var actual = new Coordinate("A1");
            var expected = new Coordinate(Letters.A, 1);
            actual.ShouldBe(expected);
        }
    }
}