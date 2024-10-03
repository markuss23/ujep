# 1. třídy
# 2. sekvenční ADT - fronta, zásobník
# 3. vyhledávací algortimy v sekvnční kolekci (ADT)
# 4. třídící algoritmy
# 5. stromy
# 6. grafy
# 7. vyhledávací algoritmy nad stromama a grafama
# 8. dědičnost

# OOP 3 pilíře
# 1. Zapouzdření
# 2. Dědičnost
# 3. Polymorfismus


class Pes:
    # konstruktor/ inicializátor/ initor
    def __init__(self, jmeno, vek) -> None:  # __ dundr
        self._jmeno = jmeno  # atribut (vlastnost) třídy v pythonu datove cleny
        self._vek = vek  # _ protected private

    # zapouzdření
    # getter a setter ... v pythonu property/vlastnost
    @property  # decorator - vlastnost, obalovac
    def jmeno(self):  # getter / accessor
        return self._jmeno

    @jmeno.setter  # setter / mutator
    def jmeno(self, value):
        self._jmeno = value if len(value) > 3 else self._jmeno

    @property
    def vek(self):
        return self._vek

    @vek.setter
    def vek(self, value):
        self._vek = value if value > 0 else self._vek

    # metoda (funkce třídy)
    def curej(
        self, na_kooho
    ) -> None:  # operace/metody/datove cleny ... budeme říkat operace a metody
        print(f"{self._jmeno} cura na {na_kooho}")

    # magicke metody/ dundr metody (pretezovani operatoru)
    def __ge__(self, other):  # self >= other -> p1=sel
        return self._vek >= other.vek

    def __add__(self, other):
        from random import choice

        if isinstance(other, Pes) == False:
            raise ValueError("Nelze scitat pes s necim jinym nez s psem")
        jmeno_stenete = self._jmeno + other.jmeno
        vek_stenete = 1
        majitele_stenete_ = choice([self._jmeno, other.jmeno])
        return Pes(jmeno_stenete, vek_stenete)


if __name__ == "__main__":
    pes = Pes("Alik", 5)
