using System;
using Battleship.GameController.Contracts;

namespace Battleship.GameController.Commands
{
    public class ShowSunkCommand : IRequest<EventAck>
    {
        public ConsoleColor Color { get; }
        public string Message { get; }

        public ShowSunkCommand(ConsoleColor color, string message)
        {
            Color = color;
            Message = message;
        }
    }
}