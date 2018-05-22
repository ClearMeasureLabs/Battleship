
using System.Net.Mime;
using Battleship.GameController.Commands;
using Battleship.GameController.Events;
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
        
        private static Container iocContainer;
        private static Bus _bus;

        static void Main()
        {
            iocContainer = new Container(new StructureMapRegistry());
            _bus = iocContainer.GetInstance<Bus>();
            var controller = new GameController(_bus);
            controller.Run();
        }
    }
}
