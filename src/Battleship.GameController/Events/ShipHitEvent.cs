using Battleship.GameController.Contracts;

namespace Battleship.GameController.Events
{
    public class ShipHitEvent : IRequest<Ack>
    {
        public Position Position { get; }

        public ShipHitEvent(Position position)
        {
            Position = position;
        }
    }
}