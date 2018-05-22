namespace Battleship.GameController.Contracts
{
    public class Position
    {
        public Letters Column { get; set; }
        public int Row { get; set; }

        public Position(Letters column, int row)
        {
            Column = column;
            Row = row;
        }

        public Position()
        {
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