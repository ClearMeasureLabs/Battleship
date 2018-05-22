
using Battleship.GameController.Commands;
using StructureMap;

namespace Battleship.Ascii
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    using GameController;
    using GameController.Contracts;

    internal class Program
    {
        private static List<Ship> myFleet;

        private static List<Ship> enemyFleet;
        private static Container iocContainer;
        private static Bus _bus;

        static void Main()
        {
            iocContainer = new Container(new StructureMapRegistry());
            _bus = iocContainer.GetInstance<Bus>();

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

            InitializeGame();

            StartGame();
        }

        private static void StartGame()
        {
            var goodThing = ConsoleColor.Green;
            var badThing = ConsoleColor.Red;
            var minorBad = ConsoleColor.DarkYellow;
            ShowCannon();
            /*
             Command List:
             Q- quit
             PositionInput - fire
             */
            do
            {
                Console.WriteLine();
                Console.WriteLine("Player, it's your turn");
                Console.WriteLine("Enter coordinates for your shot :");
                var input = Console.ReadLine();
                var position = ParsePosition(input);
                var isHit = GameController.CheckIsHit(enemyFleet, position, _bus);
                if (isHit)
                {
                    ShowHit(goodThing, "Yeah ! Nice hit !");
                    if (input == "C6")
                    {
                        Console.WriteLine("Patrol Boat was sunk!");
                    }
                }
                else
                {
                    var color = Console.ForegroundColor;
                    Console.ForegroundColor = minorBad;
                    Console.WriteLine("Miss");
                    Console.ForegroundColor = color;
                }

                position = GetRandomPosition();
                GameController.CheckIsHit(myFleet, position, _bus);
                Console.WriteLine();
                Console.WriteLine("Computer shot in {0}{1} and {2}", position.Column, position.Row, isHit ? "has hit your ship !" : "miss");
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

        private static void ShowHit(ConsoleColor color, string message)
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

        private static void ShowCannon()
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

        internal static Position ParsePosition(string input)
        {
            var letter = (Letters)Enum.Parse(typeof(Letters), input.ToUpper().Substring(0, 1));
            var number = int.Parse(input.Substring(1, 1));
            return new Position(letter, number);
        }

        private static Position GetRandomPosition()
        {
            int rows = 8;
            int lines = 8;
            var random = new Random();
            var letter = (Letters)random.Next(lines);
            var number = random.Next(rows);
            var position = new Position(letter, number);
            return position;
        }

        private static void InitializeGame()
        {
            InitializeMyFleet();

            InitializeEnemyFleet();
        }

        private static void InitializeMyFleet()
        {
            myFleet = _bus.Send(new InitializeMyFleetCommand());
        }

        private static void InitializeEnemyFleet()
        {
            enemyFleet = GameController.InitializeShips().ToList();
            Ship carrier = enemyFleet[0];

            enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 4 });
            enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 5 });
            enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 6 });
            enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 7 });
            enemyFleet[0].Positions.Add(new Position { ShipAtThisPosition = carrier, Column = Letters.B, Row = 8 });

            enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 6 });
            enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 7 });
            enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 8 });
            enemyFleet[1].Positions.Add(new Position { Column = Letters.E, Row = 9 });

            enemyFleet[2].Positions.Add(new Position { Column = Letters.A, Row = 3 });
            enemyFleet[2].Positions.Add(new Position { Column = Letters.B, Row = 3 });
            enemyFleet[2].Positions.Add(new Position { Column = Letters.C, Row = 3 });

            enemyFleet[3].Positions.Add(new Position { Column = Letters.F, Row = 8 });
            enemyFleet[3].Positions.Add(new Position { Column = Letters.G, Row = 8 });
            enemyFleet[3].Positions.Add(new Position { Column = Letters.H, Row = 8 });

            enemyFleet[4].Positions.Add(new Position { Column = Letters.C, Row = 5 });
            enemyFleet[4].Positions.Add(new Position { Column = Letters.C, Row = 6 });
        }
    }
}
