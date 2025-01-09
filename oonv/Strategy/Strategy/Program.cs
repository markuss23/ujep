using System;
using System.Collections.Generic;

class Program
{
    interface ISortStrategy
    {
        List<int> Sort(List<int> data);
    }

    class QuickSort : ISortStrategy
    {
        public List<int> Sort(List<int> data)
        {
            Console.WriteLine("QuickSort.Sort");
            var list = data;

            if (list == null)
            {
                throw new ArgumentException("Input data must be a List<int>");
            }
            QuickSortAlgorithm(list, 0, list.Count - 1);
            return list;
        }

        private void QuickSortAlgorithm(List<int> list, int low, int high)
        {
            if (low < high)
            {
                int pivotIndex = Partition(list, low, high);
                QuickSortAlgorithm(list, low, pivotIndex - 1);
                QuickSortAlgorithm(list, pivotIndex + 1, high);
            }
        }

        private int Partition(List<int> list, int low, int high)
        {
            int pivot = list[high];
            int i = low - 1;

            for (int j = low; j < high; j++)
            {
                if (list[j] <= pivot)
                {
                    i++;
                    Swap(list, i, j);
                }
            }

            Swap(list, i + 1, high);
            return i + 1;
        }

        private void Swap(List<int> list, int i, int j)
        {
            int temp = list[i];
            list[i] = list[j];
            list[j] = temp;
        }
    }
    
    class BubbleSort : ISortStrategy
    {
        public List<int> Sort(List<int> data)
        {
            Console.WriteLine("BubbleSort.Sort");
            var list = data;

            if (list == null)
            {
                throw new ArgumentException("Input data must be a List<int>");
            }

            for (int i = 0; i < list.Count - 1; i++)
            {
                for (int j = 0; j < list.Count - i - 1; j++)
                {
                    if (list[j] > list[j + 1])
                    {
                        Swap(list, j, j + 1);
                    }
                }
            }

            return list;
        }

        private void Swap(List<int> list, int i, int j)
        {
            int temp = list[i];
            list[i] = list[j];
            list[j] = temp;
        }
    }
    
    
    class Context
    {
        private ISortStrategy _sortStrategy;

        public Context(ISortStrategy sortStrategy)
        {
            _sortStrategy = sortStrategy;
        }

        public void SetSortStrategy(ISortStrategy sortStrategy)
        {
            _sortStrategy = sortStrategy;
        }

        public List<int> Sort(List<int> data)
        {
            return _sortStrategy.Sort(data);
        }
    }
    
    static void Main()
    {
        Console.WriteLine("Strategy Pattern\n");

        List<int> data = new List<int> { 100, 7, 23, 32, 5, 62, 10, 1, 3, 0, 9, 11, 4, 8, 6, 2 };
        var context = new Context(new QuickSort());

        if (data == null)
        {
            throw new ArgumentException("Input data must be a List<int>");
        }
    
        if (data.Count > 10)
        {
            context.SetSortStrategy(new QuickSort());
        }
        else
        {
            context.SetSortStrategy(new BubbleSort());
        }
        
        Console.WriteLine("Original data:");
        Console.WriteLine(string.Join(", ", data));

        var newData = context.Sort(data) ;


        Console.WriteLine("Sorted data:");
        Console.WriteLine(string.Join(", ", newData));
    }

}