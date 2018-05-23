using System;
using Battleship.GameController;
using Battleship.GameController.Commands;
using Battleship.GameController.Contracts;

namespace Battleship.Ascii
{
    public class ShowHitHandler : IRequestHandler<ShowHitCommand, EventAck>
    {
        public EventAck Handle(ShowHitCommand request)
        {
            Console.Beep();
            var origColor = Console.ForegroundColor;
            Console.ForegroundColor = request.Color;
            Console.WriteLine(@"'. \ | / ,'   ");
            Console.WriteLine(@"..' ,'        ");
            Console.WriteLine(@"( .`.|,' .)   ");
            Console.WriteLine(request.Message);
            Console.ForegroundColor = origColor;

            return EventAck.Ok;
        }
    }
}