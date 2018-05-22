using System;
using System.Collections.Generic;
using System.Linq;
using Battleship.GameController.Commands;
using Battleship.GameController.Contracts;

namespace Battleship.GameController.Handlers
{
    public class InitializeMyFleetHandler : IRequestHandler<InitializeMyFleetCommand, List<Ship>>
    {
        public List<Ship> Handle(InitializeMyFleetCommand request)
        {
            var ships = GameController.InitializeShips().ToList();

            Console.WriteLine("Please position your fleet (Game board size is from A to H and 1 to 8) :");

            foreach (var ship in ships)
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

            return ships;
        }
    }
}