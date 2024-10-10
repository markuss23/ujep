class  Singleton01
{
    public static void Main(string[] args)
    {
        var s1 = Singleton.GetInstance();
        var s2 = Singleton.GetInstance();
        Console.WriteLine(s1 == s2 ? "asdasd" : "aaaaaa");
    }
}


class Singleton
{
    private static Singleton? _instance;

    private Singleton()
    {
    }

    public static Singleton GetInstance()
    {
        return _instance ??= new Singleton();
    }
}



