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

        public Ship()
        {
            Positions = new List<Position>();
        }

        public string Name { get; set; }
        public List<Position> Positions { get; set; }
        public Color Color { get; set; }
        public int Size { get; set; }

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

        public void AddPosition(string positionCode)
        {
            if (Positions == null) Positions = new List<Position>();

            var position = new Position(positionCode)
            {
                ShipAtThisPosition = this,
                Status = PositionStatus.None
            };

            Positions.Add(position);
        }

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            var handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}