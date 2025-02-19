// Strategie pro logování
// zavazek pro Concrete Strategy
// interface ILoggerStrategy což je zavazek pro concrete strategy
public interface ILoggerStrategy
{
    void Log(string message);
}

// Konzolový logger
// Concrete Strategy
public class ConsoleLogger : ILoggerStrategy
{
    public void Log(string message)
    {
        Console.WriteLine($"[Console] {message}");
    }
}

// Souborový logger
// Concrete Strategy
public class FileLogger : ILoggerStrategy
{
    private readonly string _filePath;

    public FileLogger(string filePath)
    {
        _filePath = filePath;
        CreateFile(_filePath);
    }

    private void CreateFile(string filePath)
    {
        if (!File.Exists(filePath))
        {
            using StreamWriter writer = File.CreateText(filePath);
            writer.WriteLine("Log file vytovřen.");
        }
    }

    public void Log(string message)
    {
        using StreamWriter writer = new StreamWriter(_filePath, true);
        writer.WriteLine($"[File] {message}");
    }
}


// Singleton Logger s podporou Strategy Pattern
// Context - třída, která využívá strategii
public class Logger
{
    private static Logger? _instance;
    private ILoggerStrategy _loggerStrategy = new ConsoleLogger();

    private Logger()
    {
    }
    
    // Tato metoda zajistí, že bude vytvořena pouze jedna instance třídy Logger
    // musi se volat s nejakou strategii, jinak to neprojde
    public static Logger GetInstance()
    { 
        if (_instance == null) 
        {
            _instance = new Logger();
        }
        return _instance;
    }
    
    // Nastavení strategie
    // Určuje, jakým způsobem bude logováno
    public void SetStrategy(ILoggerStrategy loggerStrategy)
    {
        _loggerStrategy = loggerStrategy;
    }
    
    // Logování zprávy
    public void Log(string message)
    {
        _loggerStrategy.Log(message);
    }
}