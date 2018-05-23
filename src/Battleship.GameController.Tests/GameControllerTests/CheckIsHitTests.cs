using System;
using Battleship.GameController.Contracts;
using NUnit.Framework;

namespace Battleship.GameController.Tests.GameControllerTests
{
    /// <summary>
    /// The game controller tests.
    /// </summary>
    [TestFixture]
    public class BoardTests
    {
        /// <summary>
        /// The should hit the ship.
        /// </summary>
        [Test]
        public void ShouldHitTheShip()
        {
            var game = new Game();

            var counter = 0;
            foreach (var ship in game.PlayerBoard.Fleet)
            {
                var letter = (Letters)counter;
                for (int i = 0; i < ship.Size; i++)
                {
                    ship.Positions.Add(new Position(letter, i));
                }

                counter++;
            }

            var result = game.PlayerBoard.IsHit(new Coordinate(Letters.A, 1));
            Assert.IsTrue(result);
        }

        /// <summary>
        /// The should not hit the ship.
        /// </summary>
        [Test]
        public void ShouldNotHitTheShip()
        {
            var game = new Game();

            var counter = 0;
            foreach (var ship in game.PlayerBoard.Fleet)
            {
                var letter = (Letters)counter;
                for (int i = 0; i < ship.Size; i++)
                {
                    ship.Positions.Add(new Position(letter, i));
                }

                counter++;
            }

            var result = game.PlayerBoard.IsHit(new Coordinate(Letters.H, 1));
            Assert.IsFalse(result);
        }

    
    }
}