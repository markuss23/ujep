#!/bin/bash


jmeno="Petr"

echo $jmeno

if [ $jmeno = "Petr" ]; then
    echo "Jmeno je Petr"
else
    echo "Jmeno neni Petr"
fi

for i in 1 2 3 4 5; do
    echo "Cislo $i"
done

if ls / | grep lib; then
    ls / | grep lib | while IFS= read -r line; do 
        echo "$line"
    done
fi

echo "---"

# echo "Zadej jmeno: "
# read name
# echo "Zadej věk: "
# read vek

# if [ $vek > 18 ]; then
#     echo "Jsi plnoletý"
# else
#     echo "Jsi nezletilý"
# fi

# touch  soubor.txt
# ls -l > soubor.txt
# pocet=$(wc -l soubor.txt)
# # count=0
# # while IFS= read -r line; do
# #     count=$((count+1))
# # done < soubor.txt
# echo "Pocet radku: $pocet"

# pole=("Petr" "Karel" "Jana" "Marie")
# for row in ${pole[@]}; do
#     echo $row
# done


# while true; do
#     read cislo
#     if [ $cislo -eq 0 ]; then
#         break
#     elif [ $cislo -eq 1 ]; then
#         echo "Jedna"
#     elif [ $cislo -eq 2 ]; then
#         echo "Dva"
#     elif [ $cislo -eq 3 ]; then
#         echo "Tri"
#     else
#         echo "Neco jineho"
#     fi
# done

find /home/marek/ -name "*.txt" | while IFS= read -r line; do
    echo "$line"
done

exit 0