from typing import Any


class Tree:
    def __init__(self, value) -> None:
        self.value: Any = value
        self.children: list = []

    def add_child(self, child) -> None:
        self.children.append(child)


class Fifo:
    def __init__(self):
        self.items = []

    def enqueue(self, item):
        self.items.append(item)

    def dequeue(self):
        return self.items.pop(0)

    def is_empty(self):
        return len(self.items) == 0

    def size(self):
        return len(self.items)

    def get_items(self):
        return self.items


class Lifo:
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        return self.items.pop()

    def is_empty(self):
        return len(self.items) == 0

    def size(self):
        return len(self.items)


def main() -> None:
    fifo = Fifo()
    lifo = Lifo()
    tree = Tree("root")
    tree.add_child(Tree("child1"))
    tree.add_child(Tree("child2"))
    tree.add_child(Tree("child3"))
    tree.children[0].add_child(Tree("subchild11"))
    tree.children[1].add_child(Tree("subchild21"))
    tree.children[1].add_child(Tree("subchild22"))
    tree.children[2].add_child(Tree("subchild31"))
    tree.children[2].children[0].add_child(Tree("subsubchild311"))
    # BFS
    fifo.enqueue(tree)
    while not fifo.is_empty():
        node = fifo.dequeue()
        print(node.value)
        for child in node.children:
            fifo.enqueue(child)
    print("---------------------")
    # DFS
    lifo.push(tree)
    while not lifo.is_empty():
        node = lifo.pop()
        print(node.value)
        for child in reversed(node.children):
            lifo.push(child)


if __name__ == "__main__":
    main()
