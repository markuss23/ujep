from re import S
import time


class Queue:
    def __init__(self, memory: int) -> None:
        self._items: list = []
        self._memory: int = memory

    def enqueue(self, item: any) -> None:
        if len(self._items) < self._memory:
            self._items.append(item)
        else:
            print("Queue is full")

    def dequeue(self) -> None:
        if self._is_empty():
            return "Queue is empty"
        self._items.pop(0)

    def front(self) -> any:
        if self._is_empty():
            return "Queue is empty"
        return self._items[0]

    def back(self) -> any:
        if self._is_empty():
            return "Queue is empty"
        return self._items[-1]

    def size(self) -> int:
        return len(self._items)

    def is_full(self) -> bool:
        return len(self._items) == self._memory

    def get_items(self) -> list:
        return self._items

    def _is_empty(self) -> bool:
        return len(self._items) == 0


class Stack:
    def __init__(self) -> None:
        self._items: list = []

    def push(self, item: any) -> None:
        self._items.insert(0, item)

    def pop(self) -> any:
        if self._is_empty():
            return "Stack is empty"
        return self._items.pop(0)

    def peek(self) -> any:
        if self._is_empty():
            return "Stack is empty"
        return self._items[0]

    def size(self) -> int:
        if self._is_empty():
            return "Stack is empty"
        return len(self._items)

    def get_items(self) -> list:
        return self._items

    def _is_empty(self) -> bool:
        return len(self._items) == 0


def queue_test() -> None:
    queue = Queue(memory=4)
    queue.enqueue(1)
    queue.enqueue("as")
    queue.enqueue(3)
    queue.enqueue(4)

    print(queue.front())
    print(queue.back())
    print(queue.get_items())


def buffer_memory_example() -> None:
    velikost_fronty = 4
    fronta = Queue(memory=velikost_fronty)
    akumulator = 0
    t: float = time.time()
    while True:
        cislo = int(input("Zadejte cislo: "))
        print(time.time() - t)
        if time.time() - t >= velikost_fronty:
            fronta.dequeue()
            t = time.time()
        if not fronta.is_full():
            fronta.enqueue(cislo)
        else:
            print("Fronta je plna")
        print(fronta.get_items())


from queue import LifoQueue


def vyrovnane(zavorky, pary_zavorek):
    s = LifoQueue()
    for zavorka in zavorky:
        if zavorka in pary_zavorek.values():
            s.put(zavorka)
        else:
            potrebna_leva_zavorka = pary_zavorek[zavorka]
            nalezena_leva_zavorka = s.get()
            if potrebna_leva_zavorka != nalezena_leva_zavorka:
                return False
    return True


def stack_example():
    stack = Stack()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    print(stack.get_items())
    print(stack.pop())
    print(stack.get_items())
    print(stack.peek())
    print(stack.get_items())
    print(stack.size())
    print(stack.get_items())


if __name__ == "__main__":

    # queue_test()
    # buffer_memory_example()
    # stack_example()

    pary = {")": "(", "]": "[", "}": "{"}
    print(vyrovnane("([{}])", pary))
    print(vyrovnane("([({})[{}]])", pary))
    print(vyrovnane("([)", pary))
    print(vyrovnane("(])", pary))
    print(vyrovnane("((])", pary))
