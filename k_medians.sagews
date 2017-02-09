︠cfd3e068-b172-445c-96c6-d39bd44bc071s︠
import random
def razdalja(x,y):
    if len(x) != len(y):
        return False
    else:
        n=len(x)
        vsota=0
        for i in range(n):
            vsota+=abs(x[i]-y[i])
    return vsota

def CLP(tocke, k):
    p = MixedIntegerLinearProgram(maximization = False)
    x = p.new_variable(binary = True)
    y = p.new_variable(binary = True)
    n = len(tocke)
    p.set_objective(sum(sum(x[i,j]*razdalja(tocke[i], tocke[j]) for j in range(n)) for i in range(n)))
    for i in range(n):
        p.add_constraint(sum(x[i,j] for j in range(n))==1)
    p.add_constraint(sum(y[j] for j in range(n)) <= k)
    for j in range(n):
        for i in range(n):
            p.add_constraint(x[i,j]-y[j]<=0)
    p.solve()
    res1 = p.get_values(x)
    res2 = p.get_values(y)
    mnozice = {tocke[i]: tocke[j] for (i, j), v in res1.items() if v > 0}
    centri = [tocke[j] for j, v in res2.items() if v > 0]
    clusters=[]
    i=0
    while i<len(centri):
        s=[]
        for k in mnozice.keys():
            v=mnozice[k]
            if v==centri[i]:
                s.append(k)
        clusters.append(s)
        i+=1
    print('Slovar tock',mnozice, 'Seznam tock v isti mnozici',clusters, 'Seznam centrov',centri, 'Razdalja',sum(razdalja(i,j) for i,j in mnozice.items()))
    

#tocke=[(random.random()*10, random.random()*10) for x in range(10)]   
#CLP(tocke,3)


︡869eaecf-cffd-447a-af24-e1ae3f6a50fa︡{"done":true}︡










