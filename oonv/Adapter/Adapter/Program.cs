interface IClientInterface
{
    void Method(string data);
}


public class Service
{
    public void Method(string data)
    {
        Console.WriteLine("Service.Method: " + data);
    }
}


public class Adapter : IClientInterface
{
    private Service _service = new Service();

    public void Method(string data)
    {
        _service.Method(data);
    }
}


class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Adapter Pattern\n");
        
        IClientInterface client = new Adapter();
        client.Method("Adapter");
        
    }
}