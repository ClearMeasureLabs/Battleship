using System;
using System.Collections.Generic;

namespace Battleship.GameController.Contracts
{
    public class Coordinate : IEquatable<Coordinate>
    {
        public Coordinate(Letters column, int row)
        {
            Column = column;
            Row = row;
        }
        public Letters Column { get; }
        public int Row { get; }

        public override bool Equals(object obj)
        {
            return Equals(obj as Coordinate);
        }

        public bool Equals(Coordinate other)
        {
            return other != null &&
                   Column == other.Column &&
                   Row == other.Row;
        }

        public override int GetHashCode()
        {
            var hashCode = 656739706;
            hashCode = hashCode * -1521134295 + Column.GetHashCode();
            hashCode = hashCode * -1521134295 + Row.GetHashCode();
            return hashCode;
        }

        public static bool operator ==(Coordinate coordinate1, Coordinate coordinate2)
        {
            return EqualityComparer<Coordinate>.Default.Equals(coordinate1, coordinate2);
        }

        public static bool operator !=(Coordinate coordinate1, Coordinate coordinate2)
        {
            return !(coordinate1 == coordinate2);
        }
    }
}