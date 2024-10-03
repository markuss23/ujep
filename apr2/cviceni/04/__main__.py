def bubble_sort(arr: list[int]) -> list[int]:
    n: int = len(arr)  # získání délky pole

    for i in range(n):  # iterace přes všechny prvky pole
        sorted = True
        for j in range(
            0, n - i - 1
        ):  # iterace přes všechny prvky pole kromě posledních i
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                sorted = False
        if sorted:
            break

    return arr


def selection_sort(arr: list[int]) -> list[int]:
    n: int = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[min_idx] > arr[j]:
                min_idx: int = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    return arr


def fibonacci(n: int) -> int:
    print(n)
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)


def quick_sort(arr: list[int]) -> list[int]:
    if len(arr) <= 1:
        return arr
    else:
        pivot = arr[0]
        less = [x for x in arr[1:] if x <= pivot]
        greater = [x for x in arr[1:] if x > pivot]
        return quick_sort(less) + [pivot] + quick_sort(greater)


if __name__ == "__main__":
    arr = [64, 34, 25, 12, 22, 11, 90]
    print("Unsorted array is:", arr)
    print("Sorted array is:", bubble_sort(arr))
    print("Sorted (selection) array is:", selection_sort(arr))
    print("Fibonacci number is:", fibonacci(10))
    print("Hello from 04/__main__.py")
