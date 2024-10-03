from random import choice

from typing import Any


def random_choice(s: list) -> Any:
    return choice(s)


if __name__ == "__main__":
    print(random_choice([1, 2, 3, 4, 5]))
