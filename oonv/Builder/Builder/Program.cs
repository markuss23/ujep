using System.Text;

namespace Builder;
interface IBuilder
{
    void BuildPartA();
    void BuildPartB();
    void BuildPartC();
    
    void Reset();
    
    StringBuilder GetProduct();
}


class Director
{
    private IBuilder _builder;

    public Director(IBuilder builder)
    {
        _builder = builder;
    }

    public void ChangeBuilder(IBuilder builder)
    {
        _builder = builder;
    }
    
    public StringBuilder Make(string type)
    {
        _builder.Reset();
        switch (type)
        {
            case "Concrete":
                _builder.BuildPartA();
                break;
            case "Malta":
                _builder.BuildPartA();
                _builder.BuildPartB();
                _builder.BuildPartC();
                break;
            default:
                _builder.BuildPartB();
                break;
        }
       return _builder.GetProduct();
    }
}


class ConcreteBuilder : IBuilder
{
    private StringBuilder _product = new StringBuilder();
    
    public void Reset()
    {
        _product.Clear();
    }
    public void BuildPartA()
    {
        _product.Append("A");
    }

    public void BuildPartB()
    {
        _product.Append("B");
    }

    public void BuildPartC()
    {
        _product.Append("C");
    }
    
    public StringBuilder GetProduct()
    {
        return _product;
    }
}
class MaltaBuilder : IBuilder
{
    private StringBuilder _product = new StringBuilder();
    
    public void Reset()
    {
        _product.Clear();
    }
    public void BuildPartA()
    {
        _product.Append("A Malta");
    }

    public void BuildPartB()
    {
        _product.Append("B Malta");
    }

    public void BuildPartC()
    {
        _product.Append("C Malta");
    }
    
    public StringBuilder GetProduct()
    {
        return _product;
    }
}
class Program {
    static void Main( string[] args )
    {
        ConcreteBuilder b = new ConcreteBuilder();
        MaltaBuilder b2 = new MaltaBuilder();
        
        Director d = new Director(b);
        
        System.Console.WriteLine(d.Make("Concrete"));
        
        d.ChangeBuilder(b2);
        
        System.Console.WriteLine(d.Make("Malta"));
        
        
    }
}