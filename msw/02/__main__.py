import numpy as np
import timeit
import random as rd
from scipy import linalg
from matplotlib import pyplot as plt


def generate_random_vector(length: int) -> list:
    return [rd.randint(0, 100) for _ in range(length)]


def generate_random_vector_numpy(length: int) -> np.array:
    return np.arange(length, dtype=np.int64)


def scalar_product(vector1: list, vector2: list) -> int:
    if len(vector1) != len(vector2):
        raise ValueError("Vectors must have the same length")
    result: int = sum([vector1[i] * vector2[i] for i in range(len(vector1))])

    return result


def scalar_product_numpy(vector1, vector2):
    if len(vector1) != len(vector2):
        raise ValueError("Vectors must have the same length")
    result = np.dot(vector1, vector2)
    return result


def test_scalar_product() -> int:
    return scalar_product(
        generate_random_vector_numpy(length=1000),
        generate_random_vector_numpy(length=1000),
    )


def test_scalar_product_numpy() -> int:

    return scalar_product_numpy(
        generate_random_vector_numpy(length=1000),
        generate_random_vector_numpy(length=1000),
    )


if __name__ == "__main__":

    # imeit_result: float = timeit.timeit(
    #     "test_scalar_product()", globals=globals(), number=1000000
    # )
    # print(imeit_result)

    # imeit_result_numpy: float = timeit.timeit(
    #     "test_scalar_product_numpy()", globals=globals(), number=1000000
    # )
    # print(imeit_result_numpy)
    # print(generate_random_vector_numpy(1000))
    # size = 3

    # matrix = np.random.randint(0, 100, (size, size))
    # print(matrix)
    # print(matrix.shape)
    # vector = generate_random_vector(length=size)
    # result = linalg.inv(matrix).dot(vector)
    # resutl_2 = linalg.solve(matrix, vector)
    # print(result)
    # print(resutl_2)

    x = np.linspace(0, 2 * np.pi, 100)
    y = np.sin(x)

    plt.plot(x, y)
    plt.show()
