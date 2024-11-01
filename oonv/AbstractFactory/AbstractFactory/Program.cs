interface IIButton
{
    void Paint();
}

interface ICheckbox
{
    void Draw();
}


interface IGuiFactory
{
    IIButton CreateButton();
    ICheckbox CreateCheckbox();
}


class WinButton : IIButton
{
    public void Paint()
    {
        Console.WriteLine("WinButton");
    }
}

class WinCheckbox : ICheckbox
{
    public void Draw()
    {
        Console.WriteLine("WinCheckbox");
    }
}


class WinFactory : IGuiFactory
{
    public IIButton CreateButton()
    {
        return new WinButton();
    }

    public ICheckbox CreateCheckbox()
    {
        return new WinCheckbox();
    }
}




class Program
{
    static void Main()
    {
       Console.WriteLine("asd");
       IGuiFactory factory = new WinFactory();
         IIButton button = factory.CreateButton();
         ICheckbox checkbox = factory.CreateCheckbox();
         button.Paint();
         checkbox.Draw();
    }
}