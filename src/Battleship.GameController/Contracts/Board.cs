using System.Collections.Generic;

namespace Battleship.GameController.Contracts
{
    public class Board
    {
        public HashSet<Position> Positions { get; set; }
        public HashSet<Ship> Ships { get; set; }
    }
}