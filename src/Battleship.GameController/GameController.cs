using System;
using System.Collections.Generic;
using System.Linq;
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
        private IEnumerable<Ship> _myFleet;
        private IEnumerable<Ship> _enemyFleet;
        private readonly Bus _bus;

        public GameController(Bus bus)
        {
            _bus = bus;
        }

        public void Run()
        {
            _game = new Game();
            _bus.SendEvent(new GameStartedEvent());
            _bus.SendEvent(new GameAnnouncementEvent("Initializing the game"));
            InitializeGame();

            _bus.SendEvent(new GameAnnouncementEvent("Get ready to play!"));
            StartGame();
        }

        private void StartGame()
        {
            var goodThing = ConsoleColor.Green;
            var badThing = ConsoleColor.Red;
            var minorBad = ConsoleColor.DarkYellow;
            _bus.Send(new ShowCannonCommand());
            do
            {
                _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
                _bus.Send(new UserMessageCommand("Player, it's your turn."));
                var input = _bus.Send(new UserPromptQuery("Enter coordinates for your shot (A1-H8), 'S' to Surrender:"));
                switch (input?.ToUpper())
                {
                    case "S":
                        return;
                    default:
                        break;
                }

                var position = ParsePosition(input);
                var isHit = CheckIsHit(_enemyFleet, position, _bus);
                if (isHit)
                {
                    _bus.Send(new ShowHitCommand(goodThing, "Yeah! Nice hit!"));
                }
                else
                {
                    _bus.Send(new ShowMissCommand(minorBad, "Miss"));
                }

                _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
                _bus.SendEvent(new GameAnnouncementEvent("It's the computer's turn."));

                position = GetRandomPosition();
                isHit = CheckIsHit(_myFleet, position, _bus);
                _bus.Send(new UserMessageCommand($"Computer shot in {position.Column}{position.Row}"));
                _bus.Send(new UserMessageCommand(""));
                if (isHit)
                {
                    _bus.Send(new ShowHitCommand(badThing, "Oh no! You've been hit!"));
                }
                else
                {
                    _bus.Send(new ShowMissCommand(goodThing, "Miss"));
                }
            } while (true);
        }

        private Position GetRandomPosition()
        {
            var rows = 8;
            var lines = 8;
            var random = new Random();
            var letter = (Letters) random.Next(lines);
            var number = random.Next(rows);
            var position = new Position(letter, number);
            return position;
        }

        private void InitializeGame()
        {
            _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
            InitializeMyFleet();
            _bus.SendEvent(new GameAnnouncementEvent("*************************************************"));
            InitializeEnemyFleet();
        }

        private void InitializeMyFleet()
        {
            _myFleet = Ship.GetNewFleet();
            _bus.Send(new UserMessageCommand("Please position your fleet (Game board size is from A to H and 1 to 8) :"));

            foreach (var ship in _myFleet)
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

        private void InitializeEnemyFleet()
        {
            _enemyFleet = Ship.GetNewFleet();
            var fleetList = _enemyFleet.ToList();
            var carrier = fleetList[0];

            fleetList[0].Positions.Add(new Position {ShipAtThisPosition = carrier, Column = Letters.B, Row = 4});
            fleetList[0].Positions.Add(new Position {ShipAtThisPosition = carrier, Column = Letters.B, Row = 5});
            fleetList[0].Positions.Add(new Position {ShipAtThisPosition = carrier, Column = Letters.B, Row = 6});
            fleetList[0].Positions.Add(new Position {ShipAtThisPosition = carrier, Column = Letters.B, Row = 7});
            fleetList[0].Positions.Add(new Position {ShipAtThisPosition = carrier, Column = Letters.B, Row = 8});

            fleetList[1].Positions.Add(new Position {Column = Letters.E, Row = 6});
            fleetList[1].Positions.Add(new Position {Column = Letters.E, Row = 7});
            fleetList[1].Positions.Add(new Position {Column = Letters.E, Row = 8});
            fleetList[1].Positions.Add(new Position {Column = Letters.E, Row = 9});

            fleetList[2].Positions.Add(new Position {Column = Letters.A, Row = 3});
            fleetList[2].Positions.Add(new Position {Column = Letters.B, Row = 3});
            fleetList[2].Positions.Add(new Position {Column = Letters.C, Row = 3});

            fleetList[3].Positions.Add(new Position {Column = Letters.F, Row = 8});
            fleetList[3].Positions.Add(new Position {Column = Letters.G, Row = 8});
            fleetList[3].Positions.Add(new Position {Column = Letters.H, Row = 8});

            fleetList[4].Positions.Add(new Position {Column = Letters.C, Row = 5});
            fleetList[4].Positions.Add(new Position {Column = Letters.C, Row = 6});
        }

        public bool CheckIsHit(IEnumerable<Ship> ships, Position shotPosition, Bus bus)
        {
            if (ships == null) throw new ArgumentNullException("ships");

            if (shotPosition == null) throw new ArgumentNullException("shotPosition");

            foreach (var ship in ships)
            foreach (var position in ship.Positions)
                if (position.Equals(shotPosition))
                {
                    position.Status = PositionStatus.Hit;
                    bus?.SendEvent(new ShipHitEvent(shotPosition));
                    return true;
                }

            shotPosition.Status = PositionStatus.Miss;
            return false;
        }

        public bool IsShipValid(Ship ship)
        {
            return ship.Positions.Count == ship.Size;
        }

        public Position GetRandomPosition(int size)
        {
            var random = new Random();
            var letter = (Letters) random.Next(size);
            var number = random.Next(size);
            var position = new Position(letter, number);
            return position;
        }

        public static Position ParsePosition(string input)
        {
            var letter = (Letters) Enum.Parse(typeof(Letters), input.ToUpper().Substring(0, 1));
            var number = int.Parse(input.Substring(1, 1));
            return new Position(letter, number);
        }
    }
}