using System;
using System.Windows.Media;

namespace Battleship.GameController.Contracts
{
    public class ColorConfiguration
    {
        public ConsoleColor GoodThing { get; set; }
        public ConsoleColor BadThing { get; set; }
        public ConsoleColor MinorBad { get; set; }
    }
}