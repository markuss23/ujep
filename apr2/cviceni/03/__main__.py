from math import e
import re
from unittest import result


if __name__ == "__main__":
    # list_for_sorting: list[int] = [1, 2, 5, 4, 5, 4, 9, 8, 9, 10]
    # k = 5
    # result: list[int] = list_for_sorting[:k]

    # # vyhledávací algoritmus
    # for i in range(k, len(list_for_sorting)):
    #     result_min: int = min(result)
    #     if list_for_sorting[i] > result_min:
    #         print(
    #             "minimum v result",
    #             result_min,
    #             "value sorting listu",
    #             list_for_sorting[i],
    #             "index v resultu",
    #             result.index(result_min),
    #         )
    #         result[result.index(result_min)] = list_for_sorting[i]
    # print(result)

    list_for_sorting: list[int] = [1, 1, 2, 5, 4, 5, 5, 4, 9, 8, 9, 10, 10, 10]
    max_opak = 1
    sorted_list: list[int] = sorted(list_for_sorting)
    opak = 2
    result: list[int] = []
    # moje řešení
    # for i, v in enumerate(sorted_list):
    #     if i == len(sorted_list) - 1:
    #         break
    #     if v == sorted_list[i + 1]:
    #         opak += 1
    #         if opak > max_opak and v not in result:
    #             result.append(v)
    #     else:
    #         opak = 1

    # beránek řešení
    # fix = 0
    # for i in range(1, len(sorted_list)):
    #     if sorted_list[i] != sorted_list[fix]:
    #         if i - fix > max_opak:
    #             result.append(sorted_list[fix])
    #         fix = i
    # else:
    #     if i - fix > max_opak:
    #         result.append(sorted_list[fix])
    sorted_list: list[int] = [1, 2, 3, 4, 5]
    half = len(sorted_list) // 2
    hledany_prvek = 51

    if sorted_list[half] == hledany_prvek:
        print("je to tam")
    elif sorted_list[half] > hledany_prvek:
        for idx, value in enumerate(sorted_list[:half]):
            if value == hledany_prvek:
                print("index", idx, "hledany prvek", hledany_prvek)
        print("neni tam")
    elif sorted_list[half] < hledany_prvek:
        for idx, value in enumerate(sorted_list[half:]):
            if value == hledany_prvek:
                print("index", idx + half, "hledany prvek", hledany_prvek)
        print("neni tam")
