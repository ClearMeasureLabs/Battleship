using System;
using Battleship.GameController;
using Battleship.GameController.Commands;
using Battleship.GameController.Contracts;

namespace Battleship.Ascii
{
    public class ShowCannonHandler : IRequestHandler<ShowCannonCommand, EventAck>
    {
        public EventAck Handle(ShowCannonCommand request)
        {
            Console.Clear();
            Console.WriteLine(@"\-------\                                  ");
            Console.WriteLine(@" \       \                             \   ");
            Console.WriteLine(@"  \_______\_____________________________\  ");
            Console.WriteLine("  3______________________________________> ");
            Console.WriteLine("  /       /                             /  ");
            Console.WriteLine(" /       /                             /   ");
            Console.WriteLine("/-------/                                  ");
            //Console.WriteLine("                  __");
            //Console.WriteLine(@"                 /  \");
            //Console.WriteLine("           .-.  |    |");
            //Console.WriteLine(@"   *    _.-'  \  \__/");
            //Console.WriteLine(@"    \.-'       \");
            //Console.WriteLine("   /          _/");
            //Console.WriteLine(@"  |      _  /""");
            //Console.WriteLine(@"  |     /_\'");
            //Console.WriteLine(@"   \    \_/");
            //Console.WriteLine(@"    """"""""");
            return EventAck.Ok;
        }
    }
}