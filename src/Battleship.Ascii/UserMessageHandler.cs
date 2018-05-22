using System;
using Battleship.GameController;
using Battleship.GameController.Contracts;
using Battleship.GameController.Events;

namespace Battleship.Ascii
{
    public class UserMessageHandler : IRequestHandler<UserMessageCommand, EventAck>
    {
        public EventAck Handle(UserMessageCommand request)
        {
            Console.WriteLine(request.Message);
            Console.WriteLine();
            return EventAck.Ok;
        }
    }
}