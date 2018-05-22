using System;
using System.Collections.Generic;
using Battleship.GameController;
using Battleship.GameController.Contracts;
using StructureMap;
using StructureMap.Graph;

namespace Battleship.Ascii
{
    public class StructureMapRegistry : Registry
    {
        public StructureMapRegistry()
        {
            Scan(scanner =>
            {
                scanner.AssemblyContainingType<Program>();
                scanner.AssemblyContainingType<Ship>();
                scanner.WithDefaultConventions();
                scanner.ConnectImplementationsToTypesClosing(typeof(IRequestHandler<,>));
            });
            For<SingleInstanceFactory>().Use<SingleInstanceFactory>(ctx => t => GetInstance(ctx, t));
            For<MultiInstanceFactory>().Use<MultiInstanceFactory>(ctx => t => GetAllInstances(ctx, t));
        }

        private static IEnumerable<object> GetAllInstances(IContext ctx, Type t)
        {
            var allInstances = ctx.GetAllInstances(t);
            return allInstances;
        }

        private static object GetInstance(IContext ctx, Type t)
        {
            return ctx.GetInstance(t);
        }
    }
}