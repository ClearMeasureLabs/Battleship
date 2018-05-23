using System.Collections.Generic;
using System.Linq;
using Battleship.GameController.Events;

namespace Battleship.GameController.Contracts
{
    public class Board
    {
//        public IEnumerable<Position> Positions { get; set; }
        public IEnumerable<Ship> Fleet { get; set; }

        public Board()
        {
            Fleet = Ship.GetNewFleet();
        }

        public bool IsHit(Coordinate coordinate)
        {
            bool shipIsAtCoordinate = Fleet.Any(x => x.IsAt(coordinate));
            return shipIsAtCoordinate;
        }

        public Ship ShipAt(Coordinate coordinate)
        {
            Ship ship = Fleet.Single(x => x.Positions.Any(y => y.Coordinate.Equals(coordinate)));
            return ship;
        }
    }
}