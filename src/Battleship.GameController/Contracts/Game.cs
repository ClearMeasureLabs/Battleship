namespace Battleship.GameController.Contracts
{
    public class Game
    {
        public Board PlayerBoard { get; set; }
        public Board ComputerBoard { get; set; }

        public Game()
        {
            PlayerBoard = new Board();
            ComputerBoard = new Board();
        }
    }
}