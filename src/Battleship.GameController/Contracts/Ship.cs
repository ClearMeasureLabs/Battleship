using System.Collections.Generic;
using System.Windows.Media;

namespace Battleship.GameController.Contracts
{
    public class Ship
    {
        private bool _isPlaced;

        public Ship()
        {
            Positions = new List<Position>();
        }

        public string Name { get; set; }
        public List<Position> Positions { get; set; }
        public Color Color { get; set; }
        public int Size { get; set; }

        public bool IsPlaced
        {
            get => _isPlaced;
            set
            {
                if (value.Equals(_isPlaced)) return;
                _isPlaced = value;
            }
        }

        public void AddPosition(string positionCode)
        {
            if (Positions == null) Positions = new List<Position>();

            var position = new Position(positionCode)
            {
                ShipAtThisPosition = this,
                Status = PositionStatus.None
            };

            Positions.Add(position);
        }

        public static IEnumerable<Ship> GetNewFleet()
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
    }
}