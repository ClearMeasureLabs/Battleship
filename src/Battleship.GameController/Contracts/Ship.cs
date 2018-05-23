using System.Collections.Generic;
using System.Windows.Media;
using Battleship.GameController.Events;

namespace Battleship.GameController.Contracts
{
    public class Ship
    {
        public string Name { get; set; }
        public List<Position> Positions { get; set; }
        public Color Color { get; set; }
        public int Size { get; set; }

        public Ship()
        {
            Positions = new List<Position>();
        }

        public void AddPosition(string positionCode)
        {
            var coordinate = new Coordinate(positionCode);
            var position = new Position(coordinate, this);
            Positions.Add(position);
        }

        public static IEnumerable<Ship> GetNewFleet()
        {
            return new List<Ship>
            {
                new Ship {Name = AircraftCarrier, Size = 5, Color = Colors.CadetBlue},
                new Ship {Name = Battleship, Size = 4, Color = Colors.Red},
                new Ship {Name = Submarine, Size = 3, Color = Colors.Chartreuse},
                new Ship {Name = Destroyer, Size = 3, Color = Colors.Yellow},
                new Ship {Name = PatrolBoat, Size = 2, Color = Colors.Orange}
            };
        }

        public const string AircraftCarrier = "Aircraft Carrier";
        public const string Battleship = "Battleship";
        public const string Submarine = "Submarine";
        public const string Destroyer = "Destroyer";
        public const string PatrolBoat = "Patrol Boat";

        public bool IsAt(Coordinate coordinate)
        {
            foreach (var position in Positions)
            {
                if (position.Coordinate.Equals(coordinate))
                {
                    position.Status = PositionStatus.Hit;
                    return true;
                }
            }

            return false;
        }

        public bool IsSunk()
        {
            foreach (var position in Positions)
            {
                if (position.Status != PositionStatus.Hit)
                    return false;
            }

            return true;
        }
    }
}