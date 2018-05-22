using System;
using Battleship.GameController;
using Battleship.GameController.Queries;

namespace Battleship.Ascii
{
    public class UserPromptHandler : IRequestHandler<UserPromptQuery, string>
    {
        public string Handle(UserPromptQuery request)
        {
            Console.WriteLine(request.Prompt);
            var readLine = Console.ReadLine();
            return readLine;
        }
    }
}