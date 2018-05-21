using System.Collections.Generic;
using Battleship.GameController.Contracts;
using NUnit.Framework;

namespace Battleship.GameController.Tests.GameControllerTests
{
    /// <summary>
    /// The is ship valid tests.
    /// </summary>
    [TestFixture]
    public class IsShipValidTests
    {
        /// <summary>
        /// The ship is not valid.
        /// </summary>
        [Test]
        public void ShipIsNotValid()
        {
            var ship = new Ship { Name = "TestShip", Size = 3 };
            var result = GameController.IsShipValid(ship);

            Assert.IsFalse(result);
        }

        /// <summary>
        /// The ship is valid.
        /// </summary>
        [Test]
        public void ShipIsValid()
        {
            var positions = new List<Position> { new Position(Letters.A, 1), new Position(Letters.A, 1), new Position(Letters.A, 1) };

            var ship = new Ship { Name = "TestShip", Size = 3, Positions = positions };
            var result = GameController.IsShipValid(ship);

            Assert.IsTrue(result);
        }
    }
}