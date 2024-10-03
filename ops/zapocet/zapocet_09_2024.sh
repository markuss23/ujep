#!/bin/bash

echo "Kolik se přidá nových uživatelů?"
read pocet

# Kontrola jestli se přídá alespoň jeden uživatel
if [ $pocet -lt 1 ]; then
    echo "Nebyl zadán žádný uživatel."
    exit 1
fi

for (( i=1; i<=$pocet; i++ )); do
    # ziskání jmena, hesla a skupiny
    echo "Zadejte jméno uživatele $i:"
    read jmeno
    echo "Zadejte heslo uživatele $i:"
    read heslo
    echo "Zadejte skupinu uživatele $i:"
    read skupina
    # vytvoreni uzivatele
    sudo useradd $jmeno -p $heslo -g $skupina
done
exit 1