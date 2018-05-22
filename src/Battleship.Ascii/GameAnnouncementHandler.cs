using System;
using Battleship.GameController;
using Battleship.GameController.Contracts;
using Battleship.GameController.Events;

namespace Battleship.Ascii
{
    public class GameAnnouncementHandler : IRequestHandler<GameAnnouncementEvent, EventAck>
    {
        public EventAck Handle(GameAnnouncementEvent request)
        {
            Console.WriteLine("***************{0}************", request.Message);
            Console.WriteLine();
            return EventAck.Ok;
        }
    }
}