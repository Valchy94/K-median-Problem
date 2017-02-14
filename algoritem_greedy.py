from greedy_optimal import *
from Forward_Greedy import *

def alg(tocke, k, S):
    # Ustvarimo primer K-medioids:
    #km = kmedoids(tocke, [[0, 0], [0, 1], [3, 1]])
    #S = fw_greedy(tocke,k)
    km = kmedoids(tocke, S) #s prvim seznamom centrov smo začeli..
    #rešimo analizo in dobimo rezultate:
    km.process()
    mnozice = km.get_clusters()  # vrne seznam množic! Vendar v indeksih!!
    centri = km.get_medoids()  # vrne seznam centrov
    #Rabim še: množice s točkami in ceno, torej vsoto vseh razdalj!!
    
    #Da dobimo množice s točkami:
    j=0
    while j<len(tocke):
        for seznam in mnozice:
            if j in seznam:
                i = seznam.index(j) #prva pojavitev indeksa j v seznamu
                seznam[i] = tocke[j] #i-ti element v seznamu postane j-ti element v točkah
        j+=1

    #Hočemo še vsoto vseh razdalj:
    #Imamo centre in množice:
    b=0
    v=0
    while b<k:
        c=centri[b]
        for i in mnozice[b]:
            v+=razdalja(c,i)
        b+=1



    return centri, mnozice, v

#print(alg([(0,0),(7,6), (21,2), (31,5), (9,10), (5,1), (11,37), (6,10)], 3, fw_greedy([(0,0),(7,6), (21,2), (31,5), (9,10), (5,1), (11,37), (6,10)], 3)))
# Algoritem za greedy ne dela optimalno, saj je rešitev pri greedyju že sama po sebi lokalna optimalna!
# TREBA JE TOČKE ZA ZAČETNE CENTRE NAKLJUČNO IZBRATI!!!! Tako lahko v definiciji funkcije podamo seznam centrov S tudi tistega iz fw_greedy,
# vendar zgolj kot zanimivost ...


