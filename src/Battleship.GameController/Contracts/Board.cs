using System.Collections.Generic;

namespace Battleship.GameController.Contracts
{
    public class Board
    {
        public IEnumerable<Position> Positions { get; set; }
        public IEnumerable<Ship> Fleet { get; set; }

        public Board()
        {
            Fleet = Ship.GetNewFleet();
        }
    }
}