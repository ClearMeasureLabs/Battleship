using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;

namespace Battleship.GameController
{
    public delegate object SingleInstanceFactory(Type serviceType);
    public delegate IEnumerable<object> MultiInstanceFactory(Type serviceType);

    public class Bus
    {
        private readonly SingleInstanceFactory _singleInstanceFactory;
        private readonly MultiInstanceFactory _multiInstanceFactory;

        public Bus()
        {
            
        }
        public Bus(SingleInstanceFactory singleInstanceFactory, MultiInstanceFactory multiInstanceFactory)
        {
            _singleInstanceFactory = singleInstanceFactory;
            _multiInstanceFactory = multiInstanceFactory;
        }

        public virtual TResponse Send<TResponse>(IRequest<TResponse> request)
        {
            Trace.WriteLine(string.Format("Message sent: {0}", request.GetType().FullName));
            var defaultHandler = GetHandler(request);

            TResponse result = defaultHandler.Handle(request);

            return result;
        }

        public virtual void SendEvent<TResponse>(IRequest<TResponse> request)
        {
            Trace.WriteLine(string.Format("Message sent: {0}", request.GetType().FullName));
            var handlers = GetHandlers(request);
            foreach (var handler in handlers)
            {
                handler.Handle(request);
            }
        }

        private IEnumerable<RequestHandler<TResponse>> GetHandlers<TResponse>(IRequest<TResponse> request)
        {
            var handlerType = typeof(IRequestHandler<,>).MakeGenericType(request.GetType(), typeof(TResponse));
            var wrapperType = typeof(RequestHandler<,>).MakeGenericType(request.GetType(), typeof(TResponse));
            IEnumerable<object> handlers;
            try
            {
                handlers = _multiInstanceFactory(handlerType);
            }
            catch (Exception e)
            {
                throw new InvalidOperationException("Handler was not found for request of type " + request.GetType(), e);
            }

            foreach (var handler in handlers)
            {
                var wrapperHandler = Activator.CreateInstance(wrapperType, handler);
                yield return (RequestHandler<TResponse>)wrapperHandler;
            }
        }

        private RequestHandler<TResponse> GetHandler<TResponse>(IRequest<TResponse> request)
        {
            var handlerType = typeof(IRequestHandler<,>).MakeGenericType(request.GetType(), typeof(TResponse));
            var wrapperType = typeof(RequestHandler<,>).MakeGenericType(request.GetType(), typeof(TResponse));
            object handler;
            try
            {
                handler = _singleInstanceFactory(handlerType);

                if (handler == null)
                    throw new InvalidOperationException("Handler was not found for request of type " + request.GetType());
            }
            catch (Exception e)
            {
                throw new InvalidOperationException("Handler was not found for request of type " + request.GetType(), e);
            }
            var wrapperHandler = Activator.CreateInstance(wrapperType, handler);
            return (RequestHandler<TResponse>)wrapperHandler;
        }

        private abstract class RequestHandler<TResult>
        {
            public abstract TResult Handle(IRequest<TResult> message);
        }

        private class RequestHandler<TCommand, TResult> : RequestHandler<TResult> where TCommand : IRequest<TResult>
        {
            private readonly IRequestHandler<TCommand, TResult> _inner;

            public RequestHandler(IRequestHandler<TCommand, TResult> inner)
            {
                _inner = inner;
            }

            public override TResult Handle(IRequest<TResult> message)
            {
                return _inner.Handle((TCommand)message);
            }
        }

    }

    public enum RequestStatus
    {
        Success
    }
}