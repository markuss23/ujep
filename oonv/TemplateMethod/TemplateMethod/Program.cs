class Program
{
    
    
    abstract class DataMiner
    {
        public void Mine()
        {
            GetFormat();
            Tranform();
            Connect();
            Extract();
            Parse();
            Analyze();
            Report();
        }
        
        
        public void GetFormat()
        {
            Console.WriteLine("DataMiner.GetFormat");
        }
        
        public void Tranform()
        {
            Console.WriteLine("DataMiner.Tranform");
        }
        protected abstract void Connect();
        protected abstract void Extract();
        protected abstract void Parse();
        protected abstract void Analyze();
        protected abstract void Report();
    }
    
    
    class TextDataMiner : DataMiner
    {
        protected override void Connect()
        {
            Console.WriteLine("TextDataMiner.Connect");
        }
        
        protected override void Extract()
        {
            Console.WriteLine("TextDataMiner.Extract");
        }
        
        protected override void Parse()
        {
            Console.WriteLine("TextDataMiner.Parse");
        }
        
        protected override void Analyze()
        {
            Console.WriteLine("TextDataMiner.Analyze");
        }
        
        protected override void Report()
        {
            Console.WriteLine("TextDataMiner.Report");
        }
    }
    
    
    class CSVDataMiner : DataMiner
    {
        protected override void Connect()
        {
            Console.WriteLine("CsvDataMiner.Connect");
        }
        
        protected override void Extract()
        {
            Console.WriteLine("CsvDataMiner.Extract");
        }
        
        protected override void Parse()
        {
            Console.WriteLine("CsvDataMiner.Parse");
        }
        
        protected override void Analyze()
        {
            Console.WriteLine("CsvDataMiner.Analyze");
        }
        
        protected override void Report()
        {
            Console.WriteLine("CsvDataMiner.Report");
        }
    }
    
    
    class Client
    {
        public static void ClientCode(DataMiner dataMiner)
        {
            
            dataMiner.Mine();
        }
    }
    
    static void Main()
    {
        Console.WriteLine("Template Method Pattern\n");
        
        Client.ClientCode(new TextDataMiner());
        Console.WriteLine("\n");
        Client.ClientCode(new CSVDataMiner());
        
        

    }
}