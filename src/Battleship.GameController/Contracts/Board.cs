using System.Collections.Generic;
using System.Linq;
using Battleship.GameController.Events;

namespace Battleship.GameController.Contracts
{
    public class Board
    {
        public IEnumerable<Ship> Fleet { get; set; }
        public int Size { get; set; }

        public Board()
        {
            Fleet = Ship.GetNewFleet();
            Size = 10;
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

        public bool IsShipAt(Coordinate coordinate)
        {
            return Fleet.Any(x => x.Positions.Any(y => y.Coordinate.Equals(coordinate)));
        }

        public void PlaceShip(Ship ship, IEnumerable<Coordinate> shipCoordinates)
        {
            throw new System.NotImplementedException();
        }
    }
}