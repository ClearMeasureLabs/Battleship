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
            var ships = Ship.GetNewFleet();

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

            var result = new GameController(null).CheckIsHit(ships, new Position(Letters.A, 1), null);
            Assert.IsTrue(result);
        }

        /// <summary>
        /// The should not hit the ship.
        /// </summary>
        [Test]
        public void ShouldNotHitTheShip()
        {
            var ships = Ship.GetNewFleet();

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

            var result = new GameController(null).CheckIsHit(ships, new Position(Letters.H, 1), null);
            Assert.IsFalse(result);
        }

    
    }
}