import random
from scipy.optimize import linprog

def razdalja(x,y):
    return abs(x[0]-y[0])+abs(x[1]-y[1])

def k_medians(tocke, k):
    n = len(tocke)
    c = [0]*n
    for i in range(n):
        for j in range(n):
            c += [razdalja(tocke[i],tocke[j])]
    A = []
    A_eq = []
    b = []
    b_eq = []
    A.append([1]*n + [0]*(n**2))
    b.append(k)

    for i in range(1,n+1):
        for j in range(1,n+1):
            vrstica = [0]*(j-1) + [-1] + [0]*(n-j) + [0]*(n*(i-1)+j-1) + [1] + [0]*(n**2-1-(n*(i-1)+j-1))
            A.append(vrstica)
            b.append(0)

    for i in range(1,n**2+n+1):
        vrstica = [0]*(i-1) + [1] + [0]*(n**2+n-i)
        A.append(vrstica)
        b.append(1)

    for j in range(1,n+1):
        vrstica=[0]*n + ([0]*(j-1) + [1] + [0]*(n-j))*n
        A_eq.append(vrstica)
        b_eq.append(1)

    result = linprog(c, A, b, A_eq, b_eq)
    print(result.x, result.fun)

tocke = [(random.random()*10, random.random()*10) for x in range(10)]
k_medians(tocke, 3)

    


### load list of points for cluster analysis
##sample = read_sample(path);
##
### create instance of K-Medians algorithm
##kmedians_instance = kmedians(sample, [ [0.0, 0.1], [2.5, 2.6] ]);
##
### run cluster analysis and obtain results
##kmedians_instance.process();
##kmedians_instance.get_clusters();

