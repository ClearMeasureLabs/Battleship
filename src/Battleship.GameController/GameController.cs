using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Mime;
using System.Windows.Media;
using Battleship.GameController.Commands;
using Battleship.GameController.Contracts;
using Battleship.GameController.Events;
using Battleship.GameController.Queries;

namespace Battleship.GameController
{
    public class GameController
    {
        private Game _game;
        private readonly Bus _bus;
        private readonly ComputerAiController _computerAiController;
        private List<Coordinate> _computersAttempts = new List<Coordinate>();

        public GameController(Bus bus)
        {
            _bus = bus;
            _computerAiController = new ComputerAiController();
            _game = new Game();
        }

        public void Run()
        {
            _bus.SendEvent(new GameStartedEvent());
            _bus.SendEvent(new GameAnnouncementEvent("Initializing the game"));
            InitializeGame();

            _bus.SendEvent(new GameAnnouncementEvent("Get ready to play!"));
            LoopGame();
        }

        private void InitializeGame()
        {
            _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
            InitializeMyFleet();
            _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
            _computerAiController.InitializeFleet(_game.ComputerBoard);

        }

        private void LoopGame()
        {
            _bus.Send(new ShowCannonCommand());
            do
            {
                _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
                _bus.Send(new UserMessageCommand("Player, it's your turn."));
                var exitSelected = ExecutePlayerTurn();
                if (exitSelected) break;

                _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
                _bus.SendEvent(new GameAnnouncementEvent("It's the computer's turn."));

                ExecuteComputerTurn();
            } while (true);
        }

        private void InitializeMyFleet()
        {
            _bus.Send(new UserMessageCommand("Please position your fleet (Game board size is from A to J and 1 to 10) :"));

            foreach (var ship in _game.PlayerBoard.Fleet)
            {
                _bus.SendEvent(new GameAnnouncementEvent(""));
                _bus.Send(new UserMessageCommand($"Please enter the positions for the {ship.Name} (size: {ship.Size})"));

                for (var i = 1; i <= ship.Size; i++)
                {
                    var input = _bus.Send(new UserPromptQuery($"Enter position {i} of {ship.Size} (i.e A3):"));
                    ship.AddPosition(input);
                }
            }
        }

        private bool ExecutePlayerTurn()
        {
            var input = _bus.Send(new UserPromptQuery("Enter coordinates for your shot (A1-J10), 'S' to Surrender:"));
            switch (input?.ToUpper())
            {
                case "S":
                    return true;
                default:
                    break;
            }

            var coordinate = new Coordinate(input);
            bool isHit = _game.ComputerBoard.IsHit(coordinate);
            if (isHit)
            {
                Ship ship = _game.ComputerBoard.ShipAt(coordinate);
                if (ship.IsSunk())
                {
                    _bus.Send(new ShowSunkCommand(_game.Configuration.GoodThing, "Yeah! Nice hit!"));
                    _bus.SendEvent(new GameAnnouncementEvent($"You sank computer's {ship.Name}"));
                }
                else
                {
                    _bus.Send(new ShowHitCommand(_game.Configuration.GoodThing, "Yeah! Nice hit!"));
                }
            }
            else
            {
                _bus.Send(new ShowMissCommand(_game.Configuration.MinorBad, "Miss"));
            }

            return false;
        }

        private void ExecuteComputerTurn()
        {
            Coordinate coordinate = null;
            while (coordinate == null)
            {
                var theTry = _computerAiController.ChooseRandomCoordinate(_game.PlayerBoard);
                if (!_computersAttempts.Contains(theTry))
                    coordinate = theTry;

                _computersAttempts.Add(theTry);
                foreach (var computersAttempt in _computersAttempts)
                {
                    Debug.WriteLine(computersAttempt);
                }
            }
                
            bool isHit = _game.PlayerBoard.IsHit(coordinate);

            _bus.Send(new UserMessageCommand($"Computer shot in {coordinate.Column}{coordinate.Row}"));
            _bus.Send(new UserMessageCommand(""));
            if (isHit)
            {
                Ship ship = _game.PlayerBoard.ShipAt(coordinate);
                if (ship.IsSunk())
                {
                    _bus.Send(new ShowSunkCommand(_game.Configuration.BadThing, "Oh no! You've been hit!"));
                    _bus.SendEvent(new GameAnnouncementEvent($"Your {ship.Name} has been sunk"));
                }
                else
                {
                    _bus.Send(new ShowHitCommand(_game.Configuration.BadThing, "Oh no! You've been hit!"));
                }
            }
            else
            {
                _bus.Send(new ShowMissCommand(_game.Configuration.GoodThing, "Miss"));
            }
        }

        public bool IsShipValid(Ship ship)
        {
            return ship.Positions.Count == ship.Size;
        }
    }
}