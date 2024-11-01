using System;

interface IComponent
{
    string Execute();
}

class ConcreteComponent : IComponent
{
    public string Execute()
    {
        return "ConcreteComponent.Execute()";
    }
}

abstract class BaseDecorator : IComponent
{
    protected IComponent _component;

    public BaseDecorator(IComponent component)
    {
        _component = component;
    }

    public virtual string Execute()
    {
        return _component.Execute();
    }
}

class ConcreteDecoratorA : BaseDecorator
{
    public ConcreteDecoratorA(IComponent component) : base(component)
    {
    }

    public override string Execute()
    {
        return base.Execute() + " ConcreteDecoratorA.Execute()";
    }
}

class ConcreteDecoratorB : BaseDecorator
{
    public ConcreteDecoratorB(IComponent component) : base(component)
    {
    }

    public override string Execute()
    {
        return base.Execute() + " ConcreteDecoratorB.Execute()";
    }
}

class Program
{
    static void Main()
    {
        Console.WriteLine("Decorator Pattern\n");

        ConcreteComponent component = new ConcreteComponent();

        Console.WriteLine(component.Execute());

        ConcreteDecoratorA decoratorA = new ConcreteDecoratorA(component);

        Console.WriteLine(decoratorA.Execute());

        ConcreteDecoratorB decoratorB = new ConcreteDecoratorB(decoratorA);

        Console.WriteLine(decoratorB.Execute());
    }
}