using System;
using System.Windows.Media;
using Battleship.GameController.Contracts;

namespace Battleship.GameController.Commands
{
    public class ShowHitCommand : IRequest<EventAck>
    {
        public ConsoleColor Color { get; }
        public string Message { get; }

        public ShowHitCommand(ConsoleColor color, string message)
        {
            Color = color;
            Message = message;
        }
    }
}