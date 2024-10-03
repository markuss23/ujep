from abc import ABC, abstractmethod


class AbstractSoldier(ABC):
    def __init__(self, name, health, armor, weapon):
        self.name = name
        self.health = health
        self.armor = armor
        self.weapon = weapon

    @abstractmethod
    def attack(self): ...

    @abstractmethod
    def defend(self): ...

    def move(self):
        print(f"{self.name} is moving")


class Warrior(AbstractSoldier):
    def __init__(self, name, health, armor, weapon, strength):
        super().__init__(name, health, armor, weapon)
        self.strength = strength

    def attack(self):
        print(
            f"{self.name} is attacking with {self.weapon} and strength {self.strength}"
        )

    def defend(self):
        print(f"{self.name} is defending with {self.armor}")


class Marksman(AbstractSoldier):
    def __init__(self, name, health, armor, weapon, accuracy, num_arrows):
        super().__init__(name, health, armor, weapon)
        self.accuracy = accuracy
        self.num_arrows = num_arrows

    def attack(self):
        print(
            f"{self.name} is attacking with {self.weapon} and precision {self.accuracy} and {self.num_arrows} arrows"
        )

    def defend(self):
        print(f"{self.name} is defending with {self.armor}")


def main() -> None:
    warrior = Warrior("Warrior", 100, "Plate", "Sword", 10)
    marksman = Marksman("Marksman", 80, "Leather", "Bow", 0.9, 20)
    warrior.move()
    warrior.attack()
    warrior.defend()
    marksman.move()
    marksman.attack()
    marksman.defend()


if __name__ == "__main__":
    main()
