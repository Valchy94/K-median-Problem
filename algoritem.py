import optimal as go
import Forward_Greedy as fw
import random
from pprint import pprint

def alg(tocke, k, S):
    # Ustvarimo primer K-medioids:
    km = go.kmedoids(tocke, S) #s prvim seznamom centrov smo zaceli..
    #resimo analizo in dobimo rezultate:
    km.process()
    mnozice = km.get_clusters()  # vrne seznam mnozic! Vendar v indeksih!!
    centri = km.get_medoids()  # vrne seznam centrov
    #Rabim se: mnozice s tockami in ceno, torej vsoto vseh razdalj!!

    #Da dobimo mnozice s tockami:
    j=0
    while j<len(tocke):
        for seznam in mnozice:
            if j in seznam:
                i = seznam.index(j) #prva pojavitev indeksa j v seznamu
                seznam[i] = tocke[j] #i-ti element v seznamu postane j-ti element v tockah
        j+=1

    #Hocemo se vsoto vseh razdalj:
    #Imamo centre in mnozice:
    b=0
    v=0
    while b<k:
        c=centri[b]
        for i in mnozice[b]:
            v+=fw.razdalja(c,i)
        b+=1



    return v #, centri, mnozice #Če želimo, nam lahko algoritem vrne tudi centre in/ali množice! V tem primeru samo odkomentiramo, kar želimo



# TREBA JE TOCKE ZA ZACETNE CENTRE NAKLJUCNO IZBRATI!!!!
#tocke= [(random.random()*10, random.random()*10) for x in range(50)]
#k=4
def nc(k, velikost_vzorca):                                   # izracuna indekse nakljucnih centrov!
    S=[]
    while len(S) < k:
        n = random.randint(0, velikost_vzorca-1)
        if n not in S:
            S.append(n)
    return S
