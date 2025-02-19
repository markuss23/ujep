namespace oonv;

// Tovarná vytváří jen instance tříd, které implementují rozhraní ITask
// neni potřeba nic víc. prostě zadej, co chces vytvorit a ja ti to vytvorim


// interface je to závazek, co dana linka musi splnit
// Product
public interface ITask
{
    string Title { get; set; }
    bool IsCompleted { get; set; }
    void Display();
}

// concrete product
public class WorkTask: ITask
{
    public string Title { get; set; }
    public bool IsCompleted { get; set; } = false;

    public void Display()
    {
        Console.WriteLine($"[Pracovní] {Title} - {(IsCompleted ? "Ukončen" : "Probíhající")}");
    }
}

// concrete product
public class PersonalTask: ITask
{
    public string Title { get; set; }
    public bool IsCompleted { get; set; } = false;

    public void Display()
    {
        Console.WriteLine($"[Osobní] {Title} - {(IsCompleted ? "Ukončen" : "Probíhající")}");
    }
}

// Creator
// Tovární třída
class TaskFactory
{
    //  ConcreteCreator - vytváří konkrétní instance tříd
    public static ITask CreateTask(string type, string title)
    {
        
       
        switch (type.ToLower())
        {
            case "pracovni":
                return new WorkTask { Title = title };
            case "osobni":
                return new PersonalTask { Title = title };
            default:
                throw new Exception("Neplatný typ úkolu");
        }

    }
}
