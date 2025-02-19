using System;
using System.Collections.Generic;
using oonv;
using TaskFactory = oonv.TaskFactory;


class Program
{
    
    // toto je muj kral a ten rozdava ukoly
    public static void Client()
    {
        TaskManager taskManager = new TaskManager();
        Logger logger = Logger.GetInstance();
        logger.Log("Aplikace spuštěna.");
        while (true)
        {
            Console.WriteLine("\nVyberte možnost:");
            Console.WriteLine("1. Přidat ukol");
            Console.WriteLine("2. Zobrazit ukoly");
            Console.WriteLine("3. Uzavřít úkol");
            Console.WriteLine("4. Změnit logovací strategii");
            Console.WriteLine("5. Konec");
            
            Console.Write("Zadejte volbu: ");
            
            var choice = Console.ReadLine();
            IComand command = null;
            
            switch (choice)
            {
                case "1":
                    Console.Write("Uvedte Typ ukolu (Pracovni/ Osobní): ");
                    var type = Console.ReadLine();
                    Console.Write("Napište název: ");
                    var title = Console.ReadLine();
                    command = new AddTaskCommand(taskManager, type, title);
                    break;
                case "2":
                    command = new DisplayTasksCommand(taskManager);
                    break;
                case "3":
                    Console.Write("Zadejte číslo úkolu, který chcete dokončit: ");
                    if (int.TryParse(Console.ReadLine(), out int taskNumber))
                    {
                        command = new CompleteTaskCommand(taskManager, taskNumber);
                    }
                    else
                    {
                        Console.WriteLine("Neplatný vstup.");
                    }
                    break;
                case "4":
                    Console.WriteLine("Vyberte typ logování:");
                    Console.WriteLine("1. Konzolové logování");
                    Console.WriteLine("2. Logování do souboru");
                    Console.Write("Zadejte volbu: ");
                    var logChoice = Console.ReadLine();
                    switch (logChoice)
                    {
                        case "1":
                            logger.SetStrategy(new ConsoleLogger());
                            break;
                        case "2":
                            logger.SetStrategy(new FileLogger("/home/marek/projects/ujep/oonv/oonv/oonv/log.txt"));
                            break;
                        default:
                            Console.WriteLine("Neplatná volba.");
                            break;
                    }
                    continue;
                case "5":
                    return;
                default:
                    Console.WriteLine("Neplatná volba.");
                    break;
            }
            
            command?.Execute();
        }
    }
    static void Main(string[] args)
    {
        
        Client();
        
    }
}

