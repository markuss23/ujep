namespace oonv;

// Pracovník (Receiver) – Ten, kdo dělá skutečnou práci
// prida do pole ukol
// zobrazi ukoly
// dokonci ukol
class TaskManager
{
    private List<ITask> tasks = new List<ITask>();
    //private Logger logger = Logger.GetInstance();
    
    public TaskManager()
    {
        Logger.GetInstance().Log("TaskManager inicializován.");
    }

    // Přidáme metodu pro změnu logovací strategie
   /* public void SetLoggerStrategy(ILoggerStrategy strategy)
    {
        logger.SetStrategy(strategy);
        logger.Log("Logovací strategie změněna.");
    }*/

    public void AddTask(ITask task)
    {
        tasks.Add(task);
        //logger.Log($"Úkol '{task.Title}' přidán.");
        Logger.GetInstance().Log($"Úkol '{task.Title}' přidán.");
    }
    
    public void CompleteTask(int index)
    {
        if (index >= 0 && index < tasks.Count)
        {
            tasks[index].IsCompleted = true;
            Console.WriteLine($"Úkol '{tasks[index].Title}' dokončen.");
            Logger.GetInstance().Log($"Úkol '{tasks[index].Title}' dokončen.");
        }
        else
        {
            Console.WriteLine("Neplatný index úkolu.");
            Logger.GetInstance().Log("Neplatný index úkolu.");
        }
    }
    
    public void DisplayTasks()
    {
        if (tasks.Count == 0)
        {
            Console.WriteLine("Nejsou k dispozici žádné úkoly.");
            Logger.GetInstance().Log("Nejsou k dispozici žádné úkoly.");
            return;
        }
        
        for (int i = 0; i < tasks.Count; i++)
        {
            Console.Write($"{i + 1}. ");
            tasks[i].Display();
        }
        Logger.GetInstance().Log("Zobrazení úkolů.");
    }
}
// toto jsou sluzebnici
// dostanou od krale (client - main) ukol a provedou ho
// reknou pracvnik (receiver) co ma delat např přidat úkol
interface IComand{
    void Execute();
}
// Concrete Command
class AddTaskCommand : IComand
{
    private TaskManager _taskManager = null;
    private string _type = null;
    private string _title = null;
    
    public AddTaskCommand(TaskManager taskManager, string type, string title)
    {
        _taskManager = taskManager;
        _type = type;
        _title = title;
    }
    
    public void Execute()
    {
        var task = TaskFactory.CreateTask(_type, _title);
        _taskManager.AddTask(task);
        Console.WriteLine($"Úkol '{_title}' přidán.");
    }
    
}
// Concrete Command
class DisplayTasksCommand : IComand
{
    private TaskManager _taskManager = null;
    
    public DisplayTasksCommand(TaskManager taskManager)
    {
        _taskManager = taskManager;
    }
    
    public void Execute()
    {
        _taskManager.DisplayTasks();
    }
}

// Concrete Command
class CompleteTaskCommand : IComand
{
    private TaskManager _taskManager = null;
    private int _taskIndex = 0;
    
    public CompleteTaskCommand(TaskManager taskManager, int taskIndex)
    {
        _taskManager = taskManager;
        _taskIndex = taskIndex - 1;
    }
    
    public void Execute()
    {
        _taskManager.CompleteTask(_taskIndex);
    }
}