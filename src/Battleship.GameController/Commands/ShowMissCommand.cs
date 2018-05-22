using System;
using Battleship.GameController.Contracts;

namespace Battleship.GameController.Commands
{
    public class ShowMissCommand : IRequest<EventAck>
    {
        public ConsoleColor Color { get; }
        public string Message { get; }

        public ShowMissCommand(ConsoleColor color, string message)
        {
            Color = color;
            Message = message;
        }
    }
}