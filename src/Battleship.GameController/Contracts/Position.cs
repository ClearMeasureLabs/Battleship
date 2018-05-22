using System;

namespace Battleship.GameController.Contracts
{
    public class Position
    {
        public Letters Column { get; set; }
        public int Row { get; set; }
        public PositionStatus Status { get; set; }
        public Ship ShipAtThisPosition { get; set; }

        public Position(Letters column, int row)
        {
            Column = column;
            Row = row;
        }

        public Position()
        {
            Status = PositionStatus.None;
        }

        public Position(string positionCode) : this()
        {
            Column = (Letters)Enum.Parse(typeof(Letters), positionCode.ToUpper().Substring(0, 1));
            Row = int.Parse(positionCode.Substring(1, 1));
        }

        public override bool Equals(object obj)
        {
            var position = obj as Position;
            if (position == null) return false;

            return position.Column == Column && position.Row == Row;
        }

        public bool Equals(Position other)
        {
            return Column == other.Column && Row == other.Row;
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return ((int) Column * 397) ^ Row;
            }
        }
    }
}