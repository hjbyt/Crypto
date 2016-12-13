
def main():
    Q7a()
    Q7b()

def Q7a():
    print 'Q7a'
    for m in [35, 37, 38]:
        check_group(m)
        print('-'*16)

def check_group(m):
    Zm = Integers(m)
    G =  [Zm(x) for x in Zm.list_of_elements_of_multiplicative_group()]
    max_order_element = max(G, key=lambda x: x.multiplicative_order())
    max_order = max_order_element.multiplicative_order()
    max_order_elements = [x for x in G if x.multiplicative_order() == max_order]
    print 'm:', m
    is_cyclic = (max_order == len(G))
    print 'G order: ', len(G)
    print 'max order of elements in G:', max_order
    print 'is G cyclic?', is_cyclic
    print 'G elements of maximum order:', max_order_elements


def Q7b():
    print 'Q7b'
    m = 2**107 - 1
    N = 100000
    Zm = Integers(m)
    random_units = get_random_units(Zm, N)
    generators = [x for x in random_units if x.is_primitive_root()]
    A = len(generators)
    print 'N:', N
    print 'A:', A
    print 'first 10 generators:'
    for i, g in enumerate(generators[:10]):
        print '    ' + str(g)
    print 'sampled generators ratio:', float(A) / N
    print 'real generators ratio   :', float(euler_phi(m - 1)) / m

def get_random_units(Zm, count):
    return [get_random_unit(Zm) for _ in range(count)]

def get_random_unit(Zm):
    while True:
        r = Zm.random_element()
        if r.is_unit():
            return r

if __name__ == '__main__':
    main()
