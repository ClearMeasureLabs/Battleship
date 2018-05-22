using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Media;
using Battleship.GameController.Commands;
using Battleship.GameController.Contracts;
using Battleship.GameController.Events;

namespace Battleship.GameController
{
    public class GameController
    {
        private Bus _bus;
        private static List<Ship> _myFleet;

        private static List<Ship> _enemyFleet;

        public GameController(Bus bus)
        {
            _bus = bus;
        }

        public void Run()
        {
            _bus.SendEvent(new GameStartedEvent());
            Console.WriteLine("***************Initializing the game************");
            InitializeGame();

            Console.WriteLine("***************Get ready to play!************");
            StartGame();
        }

        private void StartGame()
        {
            var goodThing = ConsoleColor.Green;
            var badThing = ConsoleColor.Red;
            var minorBad = ConsoleColor.DarkYellow;
            ShowCannon();
            do
            {
                Console.WriteLine("*****************************************");
                Console.WriteLine();
                Console.WriteLine("Player, it's your turn.");
                Console.WriteLine("Enter coordinates for your shot (A1-H8), 'S' to Surrender:");
                var input = Console.ReadLine();
                switch (input?.ToUpper())
                {
                    case "Q":
                        return;
                    default:
                        break;

                }
                var position = ParsePosition(input);
                var isHit = CheckIsHit(_enemyFleet, position, _bus);
                if (isHit)
                {
                    ShowHit(goodThing, "Yeah ! Nice hit !");
                    //HACK: Remove this after the demo
                    if (input == "C6")
                    {
                        Console.WriteLine("***************You sank the Patrol Boat!************");
                    }
                }
                else
                {
                    var color = Console.ForegroundColor;
                    Console.ForegroundColor = minorBad;
                    Console.WriteLine("Miss");
                    Console.ForegroundColor = color;
                }
                Console.WriteLine("*****************************************");
                Console.WriteLine("It's the computer's turn.");

                position = GetRandomPosition();
                isHit = CheckIsHit(_myFleet, position, _bus);
                Console.WriteLine();
                Console.WriteLine("Computer shot in {0}{1}", position.Column, position.Row);
                if (isHit)
                {
                    ShowHit(badThing, "Oh no! You've been hit!");
                }
                else
                {
                    var color = Console.ForegroundColor;
                    Console.ForegroundColor = goodThing;
                    Console.WriteLine("Miss");
                    Console.ForegroundColor = color;
                }
            }
            while (true);
        }

        private Position GetRandomPosition()
        {
            int rows = 8;
            int lines = 8;
            var random = new Random();
            var letter = (Letters)random.Next(lines);
            var number = random.Next(rows);
            var position = new Position(letter, number);
            return position;
        }

        private void InitializeGame()
        {
            InitializeMyFleet();

            InitializeEnemyFleet();
        }

        private void InitializeMyFleet()
        {
            _myFleet = InitializeShips().ToList();

            Console.WriteLine("Please position your fleet (Game board size is from A to H and 1 to 8) :");

            foreach (var ship in _myFleet)
            {
                Console.WriteLine("*****************************************");
                Console.WriteLine();
                Console.WriteLine("Please enter the positions for the {0} (size: {1})", ship.Name, ship.Size);
                for (var i = 1; i <= ship.Size; i++)
                {
                    Console.WriteLine("Enter position {0} of {1} (i.e A3):", i, ship.Size);
                    ship.AddPosition(Console.ReadLine());
                }
            }
        }

        private void InitializeEnemyFleet()
        {
            _enemyFleet = InitializeShips().ToList();
            Ship carrier = _enemyFleet[0];

            _enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 4 });
            _enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 5 });
            _enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 6 });
            _enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 7 });
            _enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 8 });

            _enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 6 });
            _enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 7 });
            _enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 8 });
            _enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 9 });

            _enemyFleet[2].Positions.Add(new Position { Column = Letters.A, Row = 3 });
            _enemyFleet[2].Positions.Add(new Position { Column = Letters.B, Row = 3 });
            _enemyFleet[2].Positions.Add(new Position { Column = Letters.C, Row = 3 });

            _enemyFleet[3].Positions.Add(new Position { Column = Letters.F, Row = 8 });
            _enemyFleet[3].Positions.Add(new Position { Column = Letters.G, Row = 8 });
            _enemyFleet[3].Positions.Add(new Position { Column = Letters.H, Row = 8 });

            _enemyFleet[4].Positions.Add(new Position { Column = Letters.C, Row = 5 });
            _enemyFleet[4].Positions.Add(new Position { Column = Letters.C, Row = 6 });
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

        public IEnumerable<Ship> InitializeShips()
        {
            return new List<Ship>
            {
                new Ship {Name = "Aircraft Carrier", Size = 5, Color = Colors.CadetBlue},
                new Ship {Name = "Battleship", Size = 4, Color = Colors.Red},
                new Ship {Name = "Submarine", Size = 3, Color = Colors.Chartreuse},
                new Ship {Name = "Destroyer", Size = 3, Color = Colors.Yellow},
                new Ship {Name = "Patrol Boat", Size = 2, Color = Colors.Orange}
            };
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

        private void ShowHit(ConsoleColor color, string message)
        {
            Console.Beep();
            var origColor = Console.ForegroundColor;
            Console.ForegroundColor = color;
            Console.WriteLine(@"                \         .  ./");
            Console.WriteLine(@"              \      .:"";'.:..""   /");
            Console.WriteLine(@"                  (M^^.^~~:.'"").");
            Console.WriteLine(@"            -   (/  .    . . \ \)  -");
            Console.WriteLine(@"               ((| :. ~ ^  :. .|))");
            Console.WriteLine(@"            -   (\- |  \ /  |  /)  -");
            Console.WriteLine(@"                 -\  \     /  /-");
            Console.WriteLine(@"                   \  \   /  /");
            Console.WriteLine(message);
            Console.ForegroundColor = origColor;

        }

        private void ShowCannon()
        {
            Console.Clear();
            Console.WriteLine("                  __");
            Console.WriteLine(@"                 /  \");
            Console.WriteLine("           .-.  |    |");
            Console.WriteLine(@"   *    _.-'  \  \__/");
            Console.WriteLine(@"    \.-'       \");
            Console.WriteLine("   /          _/");
            Console.WriteLine(@"  |      _  /""");
            Console.WriteLine(@"  |     /_\'");
            Console.WriteLine(@"   \    \_/");
            Console.WriteLine(@"    """"""""");
        }

        public static Position ParsePosition(string input)
        {
            var letter = (Letters)Enum.Parse(typeof(Letters), input.ToUpper().Substring(0, 1));
            var number = Int32.Parse(input.Substring(1, 1));
            return new Position(letter, number);
        }
    }
}