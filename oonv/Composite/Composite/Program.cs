
interface IComponent
{
    void Execute();
}

class Leaf : IComponent
{
    public void Execute()
    {
        Console.WriteLine("Leaf.Execute");
    }
}

class Composite : IComponent
{
    private List<IComponent> _children = new List<IComponent>();
    
        public void Add(IComponent component)
        {
            _children.Add(component);
        }
    
        public void Remove(IComponent component)
        {
            _children.Remove(component);
        }
    
        public void Execute()
        {
            foreach (IComponent component in _children)
            {
                component.Execute();
                Console.WriteLine("--");
            }
        }
        
        public void Clear()
        {
            _children.Clear();
        }
        
        public void GetChild(int index)
        {
           Console.WriteLine("GetChild: " + _children[index]);
        }
        
        public void Count()
        {
            Console.WriteLine("Count: " + _children.Count);
        }
}


class Program {
    static void Main()
    {
        Console.WriteLine("Composite Pattern\n");
        
        
        Composite composite = new Composite();
        
        composite.Add(new Leaf());
        composite.Add(new Leaf());
        composite.Add(new Leaf());
        
        composite.Execute();
        composite.Count();
        composite.GetChild(0);
        
        


    }
}