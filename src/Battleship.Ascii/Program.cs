using Battleship.GameController;
using StructureMap;

namespace Battleship.Ascii
{
    internal class Program
    {
        private static Container iocContainer;
        private static Bus _bus;

        private static void Main()
        {
            iocContainer = new Container(new StructureMapRegistry());
            _bus = iocContainer.GetInstance<Bus>();
            var controller = new GameController.GameController(_bus);
            controller.Run();
        }
    }
}