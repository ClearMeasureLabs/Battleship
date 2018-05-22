using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Media;
using Battleship.GameController.Annotations;

namespace Battleship.GameController.Contracts
{
    public class Ship : INotifyPropertyChanged
    {
        private bool _isPlaced;
        public string Name { get; set; }
        public List<Position> Positions { get; set; }
        public Color Color { get; set; }
        public int Size { get; set; }

        public Ship()
        {
            Positions = new List<Position>();
        }

        public bool IsPlaced
        {
            get => _isPlaced;
            set
            {
                if (value.Equals(_isPlaced)) return;
                _isPlaced = value;
                OnPropertyChanged();
            }
        }


        public event PropertyChangedEventHandler PropertyChanged;

        public void AddPosition(string input)
        {
            if (Positions == null) Positions = new List<Position>();

            var letter = (Letters) Enum.Parse(typeof(Letters), input.ToUpper().Substring(0, 1));
            var number = int.Parse(input.Substring(1, 1));
            Positions.Add(new Position {Column = letter, Row = number});
        }

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            var handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}