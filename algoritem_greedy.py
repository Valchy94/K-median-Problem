from greedy_optimal import *
from Forward_Greedy import *
from Reverse_Greedy import *

def alg(tocke, k):
    # Ustvarimo primer K-medioids:
    #km = kmedoids(tocke, [[0, 0], [0, 1], [3, 1]])
    S = fw_greedy(tocke,k)
    km = kmedoids(tocke, S) #s prvim seznamom centrov smo začeli..
    #rešimo analizo in dobimo rezultate:
    km.process()
    mnozice = km.get_clusters()  # vrne seznam množic! Vendar v indeksih!!
    centri = km.get_medoids()  # vrne seznam centrov
    #Rabim še: množice s točkami in ceno, torej vsoto vseh razdalj!!

    return centri, mnozice

print(alg([(0,0),(7,6), (21,2), (31,5), (9,10), (5,1), (11,37), (6,10)], 3))


