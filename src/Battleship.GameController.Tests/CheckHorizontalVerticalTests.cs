using System;
using Battleship.GameController.Contracts;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Battleship.GameController.Tests
{
    [TestClass]
    public class CheckHorizontalVerticalTests
    {
        [TestMethod]
        public void ShipA1A2_NewPositionA3_Valid()
        {
            // Arrange
            var ship = new Ship();
            ship.Positions.Add(new Position(Letters.A,1));
            ship.Positions.Add(new Position(Letters.A,2));

            var newPosition = new Position(Letters.A,3);

            //Act
            var result = GameController.CheckHorizontalVertical(ship, newPosition);

            //Assert
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void ShipA1A2_NewPositionB2_Invalid()
        {
            // Arrange
            var ship = new Ship();
            ship.Positions.Add(new Position(Letters.A, 1));
            ship.Positions.Add(new Position(Letters.A, 2));

            var newPosition = new Position(Letters.B, 2);

            //Act
            var result = GameController.CheckHorizontalVertical(ship, newPosition);

            //Assert
            Assert.IsFalse(result);
        }
    }
}
