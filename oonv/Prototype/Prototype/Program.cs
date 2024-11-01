interface IPrototype {
    IPrototype Clone();
}



class ConcretePrototype1 : IPrototype {
    public int Data { get; set; }

    public ConcretePrototype1(int data) {
        Data = data;
    }

    public ConcretePrototype1(ConcretePrototype1 prototype) {
        Data = prototype.Data;
    }

    public IPrototype Clone() {
        return new ConcretePrototype1(this);
    }
}


class Program {
    static void Main( string[] args )
    {
       Console.WriteLine("asd");
       
         ConcretePrototype1 prototype = new ConcretePrototype1(100);
         Console.WriteLine(prototype.Data);
         prototype.Data = 200;
         ConcretePrototype1 clone = (ConcretePrototype1)prototype.Clone();
         Console.WriteLine(clone.Data);
        
        
    }
}