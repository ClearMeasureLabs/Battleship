using System;
using System.Linq;
using Battleship.GameController.Contracts;

namespace Battleship.GameController
{
    public class ComputerAiController
    {
        public void InitializeFleet(Board board)
        {
            var fleetList = board.Fleet.ToList();
            foreach (Ship ship in fleetList)
            {
                Coordinate startingCoordinate = GetUntakenRandomCoordinate(board);
                PlaceShipCoordinatesForShipStartingAt(startingCoordinate, ship);
            }

            foreach (Ship ship in board.Fleet)
            {
                Console.WriteLine(ship.Name);
                foreach (Position position in ship.Positions)
                {
                    Console.WriteLine(position.Coordinate.Column + " " + position.Coordinate.Row);
                }
            }
        }

        private void PlaceShipCoordinatesForShipStartingAt(Coordinate startingCoordinate,
            Ship ship)
        {

            for (int i = 0; i < ship.Size; i++)
            {
                ship.Positions.Add(new Position(
                    startingCoordinate.Column, startingCoordinate.Row + i, ship));
            }
            //look at adjacent coordinates and see if ship.Size number of them
            //is unoccupied.
            //Pick random direction
            //If direction doesn't have space, try again
            //return collection of coordinates in that direction - yield return
        }

        private Coordinate GetUntakenRandomCoordinate(Board board)
        {
            do
            {
                Coordinate randomCoordinate = ChooseRandomCoordinate(board);
                if (!board.IsShipAt(randomCoordinate)) return randomCoordinate;
            } while (true);
        }

        public Coordinate ChooseRandomCoordinate(Board board)
        {
            var rows = board.Size;
            var lines = board.Size;
            var random = new Random();
            var letter = (Letters)random.Next(1, lines);
            var number = random.Next(1, rows);
            var coordinate = new Coordinate(letter, number);
            return coordinate;
        }
    }
}