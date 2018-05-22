using Battleship.GameController.Contracts;

namespace Battleship.GameController.Events
{
    public class GameAnnouncementEvent : IRequest<EventAck>
    {
        public string Message { get; }

        public GameAnnouncementEvent(string message)
        {
            Message = message;
        }
    }
}