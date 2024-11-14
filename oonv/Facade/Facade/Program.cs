
class SubSystemA
{
    public void MethodA()
    {
        Console.WriteLine("MethodA");
    }
}


class SubSystemB
{
    public void MethodB()
    {
        Console.WriteLine("MethodB");
    }
}


class Facade
{
    private SubSystemA _subSystemA;
    private SubSystemB _subSystemB;

    public Facade()
    {
        _subSystemA = new SubSystemA();
        _subSystemB = new SubSystemB();
    }

    public void convert(String type)
    {
        if (type == "A")
        {
            _subSystemA.MethodA();
        }
        else if (type == "B")
        {
            _subSystemB.MethodB();
        }
    }
}


class Program
{
    static void Main()
    {
       Console.WriteLine("Facade Pattern\n");
       
         Facade facade = new Facade();
         
         
            facade.convert("A");
            facade.convert("B");
    }
}