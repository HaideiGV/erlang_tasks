from concurrent.futures import ThreadPoolExecutor
import asyncio
import math


def is_prime(n):
    if n % 2 == 0:
        return False

    sqrt_n = int(math.floor(math.sqrt(n)))
    for i in range(3, sqrt_n + 1, 2):
        if n % i == 0:
            return False
    print(n)
    return True


def modify_file(path):
    lines = []
    with open(path, 'r', encoding='utf-8') as fl:
        lines.append(fl.readline())
    for line in lines:
        print(' > ', len(line))


pool = ThreadPoolExecutor(5)

future1 = pool.submit(is_prime, 10)
future2 = pool.submit(modify_file, 'dialogs.htm')

print(future1.done())
print(future2.done())

print(future1.result())
print(future2.result())