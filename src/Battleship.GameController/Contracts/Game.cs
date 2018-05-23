using System;
using System.Windows.Media;

namespace Battleship.GameController.Contracts
{
    public class Game
    {
        public Board PlayerBoard { get; set; }
        public Board ComputerBoard { get; set; }
        public ColorConfiguration Configuration { get; set; }

        public Game()
        {
            PlayerBoard = new Board();
            ComputerBoard = new Board();
            Configuration = new ColorConfiguration()
            {
                BadThing = ConsoleColor.Red,
                GoodThing = ConsoleColor.Green,
                MinorBad = ConsoleColor.DarkYellow
            };
        }
    }
}