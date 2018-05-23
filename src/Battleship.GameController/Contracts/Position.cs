using System;
using System.Collections.Generic;

namespace Battleship.GameController.Contracts
{
    public class Position : IEquatable<Position>
    {
        public Coordinate Coordinate;
        public PositionStatus Status { get; set; }
        public Ship ShipAtThisPosition { get; set; }

        public Position(Letters column, int row, Ship shipAtThisPosition) : this(column, row)
        {
            ShipAtThisPosition = shipAtThisPosition;
        }
        public Position(Letters column, int row) : this()
        {
            Coordinate = new Coordinate(column, row);
        }

        private Position()
        {
            Status = PositionStatus.None;
        }

        public Position(Coordinate coordinate, Ship ship) : this()
        {
            Coordinate = coordinate;
            ShipAtThisPosition = ship;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as Position);
        }

        public bool Equals(Position other)
        {
            return other != null &&
                   EqualityComparer<Coordinate>.Default.Equals(Coordinate, other.Coordinate);
        }

        public override int GetHashCode()
        {
            return -1638168797 + EqualityComparer<Coordinate>.Default.GetHashCode(Coordinate);
        }

        public static bool operator ==(Position position1, Position position2)
        {
            return EqualityComparer<Position>.Default.Equals(position1, position2);
        }

        public static bool operator !=(Position position1, Position position2)
        {
            return !(position1 == position2);
        }
    }
}