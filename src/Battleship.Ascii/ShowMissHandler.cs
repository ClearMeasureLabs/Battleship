using System;
using Battleship.GameController;
using Battleship.GameController.Commands;
using Battleship.GameController.Contracts;

namespace Battleship.Ascii
{
    public class ShowMissHandler : IRequestHandler<ShowMissCommand, EventAck>
    {
        public EventAck Handle(ShowMissCommand request)
        {
            var color = Console.ForegroundColor;
            Console.ForegroundColor = request.Color;
            Console.WriteLine(request.Message);
            Console.ForegroundColor = color;

            return EventAck.Ok;
        }
    }
}