

class  Device
{
    private bool isEnabled;
    private int volume;
    
    public  void Enable()
    {
        isEnabled = true;
    }
    
    public  void Disable()
    {
        isEnabled = false;
    }
    
    public bool IsEnabled()
    {
        return isEnabled;
    }
    
    public int GetVolume()
    {
        return volume;
    }
    
    public void SetVolume(int vol)
    {
        this.volume = vol;
    }
}



class Remote
{
    protected Device device;
    
    public Remote(Device device)
    {
        this.device = device;
    }
    
    public void TogglePower()
    {
        if (device.IsEnabled())
        {
            device.Disable();
        }
        else
        {
            device.Enable();
        }
    }
    
    public void VolumeDown()
    {
        device.SetVolume(device.GetVolume() - 10);
    }
    
    public void VolumeUp()
    {
        device.SetVolume(device.GetVolume() + 10);
    }
}


class Program
{
    static void Main()
    {
        Console.WriteLine("Bridge Pattern\n");
        Device device = new Device();
        
        Remote remote = new Remote(device);
        
        remote.TogglePower();
        Console.WriteLine("IsEnabled: " + device.IsEnabled());
        remote.TogglePower();
        Console.WriteLine("IsEnabled: " + device.IsEnabled());
        
        if (device.IsEnabled())
        {
            remote.VolumeUp();
            Console.WriteLine("Volume: " + device.GetVolume());
        }
        
    }
}