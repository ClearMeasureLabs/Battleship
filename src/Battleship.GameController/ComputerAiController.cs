﻿using System;
using System.Linq;
using Battleship.GameController.Contracts;

namespace Battleship.GameController
{
    public class ComputerAiController
    {
        public void InitializeFleet(Board board)
        {
            var fleetList = board.Fleet.ToList();

            Ship carrier = fleetList.Single(s=>s.Name.Equals(Ship.AircraftCarrier));
            fleetList[0].Positions.Add(new Position(Letters.B, 4, carrier));
            fleetList[0].Positions.Add(new Position(Letters.B, 5, carrier));
            fleetList[0].Positions.Add(new Position(Letters.B, 6, carrier));
            fleetList[0].Positions.Add(new Position(Letters.B, 7, carrier));
            fleetList[0].Positions.Add(new Position(Letters.B, 8, carrier));

            Ship battleship = fleetList.Single(s => s.Name.Equals(Ship.Battleship));
            fleetList[1].Positions.Add(new Position(Letters.E, 6, battleship));
            fleetList[1].Positions.Add(new Position(Letters.E, 7, battleship));
            fleetList[1].Positions.Add(new Position(Letters.E, 8, battleship));
            fleetList[1].Positions.Add(new Position(Letters.E, 9, battleship));

            Ship destroyer = fleetList.Single(s => s.Name.Equals(Ship.Destroyer));
            fleetList[2].Positions.Add(new Position(Letters.A, 3, destroyer));
            fleetList[2].Positions.Add(new Position(Letters.B, 3, destroyer));
            fleetList[2].Positions.Add(new Position(Letters.C, 3, destroyer));

            Ship submarine = fleetList.Single(s => s.Name.Equals(Ship.Submarine));
            fleetList[3].Positions.Add(new Position(Letters.F, 8, submarine));
            fleetList[3].Positions.Add(new Position(Letters.G, 8, submarine));
            fleetList[3].Positions.Add(new Position(Letters.H, 8, submarine));

            Ship patrolBoat = fleetList.Single(s => s.Name.Equals(Ship.Submarine));
            fleetList[4].Positions.Add(new Position(Letters.C, 5, patrolBoat));
            fleetList[4].Positions.Add(new Position(Letters.C, 6, patrolBoat));
        }

        public Position ChooseMissileTarget()
        {
            var rows = 8;
            var lines = 8;
            var random = new Random();
            var letter = (Letters)random.Next(lines);
            var number = random.Next(rows);
            var position = new Position(letter, number);
            return position;
        }
    }
}