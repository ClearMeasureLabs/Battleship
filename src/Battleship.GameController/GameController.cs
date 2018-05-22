using System;
using System.Collections.Generic;
using System.Windows.Media;
using Battleship.GameController.Contracts;
using Battleship.GameController.Events;

namespace Battleship.GameController
{
    public class GameController
    {
        public static bool CheckIsHit(IEnumerable<Ship> ships, Position shotPosition, Bus bus)
        {
            if (ships == null) throw new ArgumentNullException("ships");

            if (shotPosition == null) throw new ArgumentNullException("shotPosition");

            foreach (var ship in ships)
            foreach (var position in ship.Positions)
                if (position.Equals(shotPosition))
                {
                    position.Status = PositionStatus.Hit;
                    bus?.Send(new ShipHitEvent(shotPosition));
                    return true;
                }
                    
            shotPosition.Status = PositionStatus.Miss;
            return false;
        }

        public static IEnumerable<Ship> InitializeShips()
        {
            return new List<Ship>
            {
                new Ship {Name = "Aircraft Carrier", Size = 5, Color = Colors.CadetBlue},
                new Ship {Name = "Battleship", Size = 4, Color = Colors.Red},
                new Ship {Name = "Submarine", Size = 3, Color = Colors.Chartreuse},
                new Ship {Name = "Destroyer", Size = 3, Color = Colors.Yellow},
                new Ship {Name = "Patrol Boat", Size = 2, Color = Colors.Orange}
            };
        }

        public static bool IsShipValid(Ship ship)
        {
            return ship.Positions.Count == ship.Size;
        }

        public static Position GetRandomPosition(int size)
        {
            var random = new Random();
            var letter = (Letters) random.Next(size);
            var number = random.Next(size);
            var position = new Position(letter, number);
            return position;
        }
    }
}