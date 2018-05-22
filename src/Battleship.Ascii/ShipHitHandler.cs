using System;
using Battleship.GameController;
using Battleship.GameController.Contracts;
using Battleship.GameController.Events;

namespace Battleship.Ascii
{
    public class ShipHitHandler : IRequestHandler<ShipHitEvent, EventAck>
    {
        public EventAck Handle(ShipHitEvent request)
        {
//            Console.WriteLine("{0} hit", request.Position.ShipAtThisPosition.Name);
            return EventAck.Ok;
        }
    }
}