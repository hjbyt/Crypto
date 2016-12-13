
p = 3
N = p**4

def main():
    Q8()

def Q8():
    R.<x> = QQ[]
    f = x^4 + x^3 + x^2 + x + 1
    print 'f(x)         :', f
    print 'f(x) factors :', f.factor_mod(p)
    print 'f irreducible?', len(f.factor_mod(p)) == 1

    K.<a> = GF(N, name='a', modulus=f(x))
    units = [g for g in K if g.is_unit()]
    generators = {g for g in units if is_generator(g)}
    print 'multiplicative generators count:', len(generators)
    print 'multiplicative generators      :'
    for g in generators:
        print '    ' + str(g)

def is_generator(y):
    return y.multiplicative_order() == N - 1

if __name__ == '__main__':
    main()
