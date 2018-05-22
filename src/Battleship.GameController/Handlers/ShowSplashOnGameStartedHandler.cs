using System;
using Battleship.GameController.Contracts;
using Battleship.GameController.Events;

namespace Battleship.GameController.Handlers
{
    public class ShowSplashOnGameStartedHandler : IRequestHandler<GameStartedEvent, EventAck>
    {
        public EventAck Handle(GameStartedEvent request)
        {
            Console.WriteLine("                                     |__");
            Console.WriteLine(@"                                     |\/");
            Console.WriteLine("                                     ---");
            Console.WriteLine("                                     / | [");
            Console.WriteLine("                              !      | |||");
            Console.WriteLine("                            _/|     _/|-++'");
            Console.WriteLine("                        +  +--|    |--|--|_ |-");
            Console.WriteLine(@"                     { /|__|  |/\__|  |--- |||__/");
            Console.WriteLine(@"                    +---------------___[}-_===_.'____                 /\");
            Console.WriteLine(@"                ____`-' ||___-{]_| _[}-  |     |_[___\==--            \/   _");
            Console.WriteLine(@" __..._____--==/___]_|__|_____________________________[___\==--____,------' .7");
            Console.WriteLine(@"|                        Welcome to Battleship                         BB-61/");
            Console.WriteLine(@" \_________________________________________________________________________|");
            Console.WriteLine();
            return EventAck.Ok;
        }
    }

    public class My2Handler : IRequestHandler<GameStartedEvent, EventAck>
    {
        public EventAck Handle(GameStartedEvent request)
        {
            //Console.WriteLine("Howdy howdy2");
            return EventAck.Ok;
        }
    }
}