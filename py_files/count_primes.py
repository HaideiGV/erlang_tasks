

def primeFactors(n):
    d = {}

    while n != 1:
        for i in range(1, n):
            if n % i == 0:
                l = d.setdefault(str(i), [])
                l.append(i)
                d.pop(str(i))
                d[str(i)] = l
                n = n/i    
    res = ''
    for k, v in d.items():
        res = res + "({}**{})".format(k, len(v))      
    return res


print(primeFactors(7775460))