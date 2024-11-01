class TreeType {
    public string Name { get; set; }
    public string Color { get; set; }
    public string Texture { get; set; }
    
    public TreeType(string name, string color, string texture) {
        Name = name;
        Color = color;
        Texture = texture;
    }
}


class TreeFactory {
    private static Dictionary<string, TreeType> _treeTypes = new Dictionary<string, TreeType>();
    
    public static TreeType GetTreeType(string name, string color, string texture) {
        if (!_treeTypes.ContainsKey(name)) {
            _treeTypes[name] = new TreeType(name, color, texture);
        }
        
        return _treeTypes[name];
    }
}


class Tree {
    public int X { get; set; }
    public int Y { get; set; }
    public TreeType Type { get; set; }
    
    public Tree(int x, int y, TreeType type) {
        X = x;
        Y = y;
        Type = type;
    }
    
    public void Draw() {
        Console.WriteLine($"Drawing tree at ({X}, {Y}) with type {Type.Name}, color {Type.Color}, and texture {Type.Texture}");
    }
}


class Forest {
    private List<Tree> _trees = new List<Tree>();
    
    public void PlantTree(int x, int y, string name, string color, string texture) {
        var type = TreeFactory.GetTreeType(name, color, texture);
        var tree = new Tree(x, y, type);
        _trees.Add(tree);
    }
    
    public void Draw() {
        foreach (var tree in _trees) {
            tree.Draw();
        }
    }
}

class Program {
    static void Main(string[] args) {
        Console.WriteLine("FlyWeight Pattern\n");
        
        var forest = new Forest();
        
        forest.PlantTree(1, 2, "Oak", "Green", "Rough");
        forest.PlantTree(3, 4, "Pine", "Brown", "Smooth");
        forest.PlantTree(5, 6, "Oak", "Green", "Rough");
        
        forest.Draw();
    }
}