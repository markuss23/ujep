using System;

interface IService
{
    void Operation();
}

class Service : IService
{
    public void Operation()
    {
        Console.WriteLine("Executing Operation in Real Service");
    }
}

class Proxy : IService
{
    private IService _realService;

    public Proxy(IService realService)
    {
        _realService = realService;
    }

    public bool CheckAccess()
    {
        Console.WriteLine("Checking access in Proxy...");
        return true;
    }

    public void Operation()
    {
        if (CheckAccess())
        {
            if (_realService == null)
            {
                _realService = new Service();
            }

            _realService.Operation();
        }
        else
        {
            Console.WriteLine("asdasd.");
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Proxy Pattern\n");
        IService proxy = new Proxy(new Service());
        proxy.Operation();
    }
}