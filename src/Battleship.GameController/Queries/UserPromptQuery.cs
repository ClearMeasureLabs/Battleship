using System;

namespace Battleship.GameController.Queries
{
    public class UserPromptQuery : IRequest<string>
    {
        public string Prompt { get; }

        public UserPromptQuery(string prompt)
        {
            Prompt = prompt;
        }
    }
}