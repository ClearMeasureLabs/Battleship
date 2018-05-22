using Battleship.GameController.Contracts;

namespace Battleship.GameController.Events
{
    public class UserMessageCommand : IRequest<EventAck>
    {
        public UserMessageCommand(string message)
        {
            Message = message;
        }

        public string Message { get; }
    }
}