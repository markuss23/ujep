def counting_sort(arr: list[int]) -> list[int]:
    max_element = max(arr)
    print("Max element is:", max_element)
    count_array: list[int] = [0 for _ in range(max_element + 1)]
    print("Count array is:", count_array)
    for element in arr:
        count_array[element] += 1
    print("Count array is:", count_array)
    cumulative_sum: list[int] = [0 for _ in range(max_element + 1)]

    for idx, val in enumerate(count_array):
        cumulative_sum[idx] = cumulative_sum[idx - 1] + val
    print("Cumulative sum is:", cumulative_sum)

    output_array: list[int] = [0 for _ in range(len(arr))]
    for element in arr:

        output_array[cumulative_sum[element] - 1] = element
        cumulative_sum[element] -= 1
        print(
            "element is:",
            element,
            "output_array[cumulative_sum[element] - 1]:",
            output_array[cumulative_sum[element] - 1],
        )
    print("Output array is:", output_array)


def bucket_sort(arr: list[float]) -> list[float]:
    sub_buckets = [[] for _ in range(10)]
    print("Sub buckets are:", sub_buckets)

    for element in arr:
        sub_buckets[int(element * 10)].append(element)
    print("Sub buckets are:", sub_buckets)

    for sub_bucket in sub_buckets:
        sub_bucket.sort()
    print("Sub buckets are:", sub_buckets)

    result: list = []
    for sub_bucket in sub_buckets:
        if sub_bucket == []:
            continue
        for element in sub_bucket:
            result.append(element)
    print("Result is:", result)


if __name__ == "__main__":
    # arr: list[int] = [1, 3, 1, 8, 5, 6, 7, 8, 9, 10]
    # counting_sort(arr)
    arr_list: list[float] = [0.11, 0.19, 0.1, 0.2, 0.33, 0.3, 0.4, 0.5, 0.6, 0.7]
    bucket_sort(arr_list)
    print("Hello from 05/__main__.py")
