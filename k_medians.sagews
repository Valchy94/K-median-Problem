︠513e3184-1672-4614-96a1-59877df21c72s︠
import Forward_Greedy as fg
import algoritem as ag
import optimal as go
from pprint import pprint
import matplotlib.pyplot as plt
import random
#najprej potrebujemo definirano manhattansko razdaljo:
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
    p.set_objective(sum(sum(x[i,j]*razdalja(tocke[i], tocke[j]) for j in range(n)) for i in range(n)))  #objektna funkcija
    for i in range(n):
        p.add_constraint(sum(x[i,j] for j in range(n))==1)  #omejitve
    p.add_constraint(sum(y[j] for j in range(n)) <= k)
    for j in range(n):
        for i in range(n):
            p.add_constraint(x[i,j]-y[j]<=0)
    p.solve()
    res1 = p.get_values(x)
    res2 = p.get_values(y)
    mnozice = {tocke[i]: tocke[j] for (i, j), v in res1.items() if v > 0} #zapisemo mnozice v slovar (nam vrze, katera mnozica spada v kateri center)
    centri = [tocke[j] for j, v in res2.items() if v > 0]  #zapisemo centre v seznam
    
    #Ce zelimo, lahko dobimo se sezname tock, ki pripadajo istim centrom (to bi nam vrnil seznam clusters, ce ga odkomentiramo)
    #clusters=[]
    #i=0
    #while i<len(centri):
    #    s=[]
    #    for k in mnozice.keys():
    #        v=mnozice[k]
    #        if v==centri[i]:
    #            s.append(k)
    #    clusters.append(s)
    #    i+=1
    #print('Slovar tock',mnozice, 'Seznam tock v isti mnozici',clusters, 'Seznam centrov',centri, 'Razdalja',sum(razdalja(i,j) for i,j in mnozice.items()))
    return sum(razdalja(i,j) for i,j in mnozice.items()) #, centri - to lahko dodamo, ce potrebujemo te centre!

#Racunamo razlike v ceni pri teh dveh algoritmih za razlicne k pri vzorcu velikosti 100; k pozenemo od 1 do 50
#n=50
#tocke=[(random.random()*10, random.random()*10) for x in range(100)]
#m=len(tocke)

#Definirajmo funkcijo nakljcentri, ker sage ne dojame da ima funkcija nc iz alg 2 parametra:
def nakljcentri(k, velikost_vzorca):                                   # izracuna nakljucne centre!
    S=[]
    while len(S) < k:
        n = random.randint(0, velikost_vzorca-1)
        if n not in S:
            S.append(n)
    return S
#Generiramo en graf, ki bo pokazal, kako se razlikujeta ceni glede na spremembo k (lahko potem se gledamo, kaksna je razlika med rezultatoma pri fiksnem k, ce spreminjamo velikost vzorca ...).

k=list(range(1,n+1))
cene_clp=[]
cene_fg=[]
cene_hevr=[]
#Ce naslednji del kode odkomentiramo, lahko dobimo grafe ...
#for i in range(n):
#    S=nakljcentri(k[i],m) #nakljucni centri
     #clp=ag.alg(tocke, i+1, S)
#    cene_hevr.append(ag.alg(tocke, k[i], S))
#    cene_clp.append(CLP(tocke, k[i]))
#    cene_fg.append(fg.fw_greedy(tocke, k[i]))
#izracunamo razlike, ker same vrednosti niso bistvene,
#bolj je pomembno kako se metodi razlikujeta
#razlike_cen= [a_i - b_i for a_i, b_i in zip(cene_hevr, cene_fg)]
#naredimo graf
#plt.plot(k, razlike_cen)
#plt.ylabel("Razlike cen med pozresno metodo in implementiranim algoritmom")
#plt.xlabel("Stevilo centrov k")
#plt.show()
#Spreminjajmo se n pri fiksnem k=10:
n1=list(range(10,101))
k1=10
cene_clp1=[]
cene_hevr1=[]
cene_fg1=[]
tocke1=[]
#for nabor in n1:
#    tocke1.append([(random.random()*10, random.random()*10) for x in range(nabor)])  #Da imamo nabor tock ki tvorijo vzorec
#for i in range(len(n1)):
#    S=nakljcentri(k1,n1[i])
#    cene_hevr1.append(ag.alg(tocke1[i], k1, S))
#    cene_clp1.append(CLP(tocke1[i], k1))
#    cene_fg1.append(fg.fw_greedy(tocke1[i], k1))
#razlike_cen1 = [a_i - b_i for a_i, b_i in zip(cene_hevr1, cene_fg1)]
#plt.plot(n1, razlike_cen1)
#plt.ylabel("Razlike cen med implementiranim algoritmom in pozresno metodo")
#plt.xlabel("Velikost vzorca pri fiksnem k (=10)")
#plt.show()

︡2f1ae285-a1e5-44f9-9514-d7f2256c3177︡{"done":true}︡










