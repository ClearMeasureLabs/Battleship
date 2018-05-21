using System;
using Battleship.GameController.Contracts;
using NUnit.Framework;

namespace Battleship.GameController.Tests.GameControllerTests
{
    /// <summary>
    /// The game controller tests.
    /// </summary>
    [TestFixture]
    public class GameControllerTests
    {
        /// <summary>
        /// The should hit the ship.
        /// </summary>
        [Test]
        public void ShouldHitTheShip()
        {
            var ships = GameController.InitializeShips();

            var counter = 0;
            foreach (var ship in ships)
            {
                var letter = (Letters)counter;
                for (int i = 0; i < ship.Size; i++)
                {
                    ship.Positions.Add(new Position(letter, i));
                }

                counter++;
            }

            var result = GameController.CheckIsHit(ships, new Position(Letters.A, 1));
            Assert.IsTrue(result);
        }

        /// <summary>
        /// The should not hit the ship.
        /// </summary>
        [Test]
        public void ShouldNotHitTheShip()
        {
            var ships = GameController.InitializeShips();

            var counter = 0;
            foreach (var ship in ships)
            {
                var letter = (Letters)counter;
                for (int i = 0; i < ship.Size; i++)
                {
                    ship.Positions.Add(new Position(letter, i));
                }

                counter++;
            }

            var result = GameController.CheckIsHit(ships, new Position(Letters.H, 1));
            Assert.IsFalse(result);
        }

        /// <summary>
        /// The throw exception if positstion is null.
        /// </summary>
        [Test]
        public void ThrowExceptionIfPositstionIsNull()
        {
            Assert.That(() =>
                    GameController.CheckIsHit(new []{new Ship()}, null),
                Throws.ArgumentNullException);
        }

        /// <summary>
        /// The throw exception if ship is null.
        /// </summary>
        [Test]
        public void ThrowExceptionIfShipIsNull()
        {
            Assert.That(() => 
                GameController.CheckIsHit(null, new Position(Letters.H, 1)),
                Throws.ArgumentNullException);
        }
    }
}