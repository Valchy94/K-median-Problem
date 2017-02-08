from Forward_Greedy import *

def rev_greedy(S,k):
    tocke=[]
    while len(S) > k:
        a=cena(S[1:], tocke+[S[0]])
        print(a)
        j=0
        while j<len(S):
            if cena(S[0:j]+S[j+1:], tocke+[S[j]]) < a:
                i=j
                a=cena(S[0:j]+S[j+1:], tocke+[S[j]])
                print(a)
            j+=1
        tocke += [S[i]]
        del S[i]
    a=cena(S, tocke)
    print('Seznam centrov:',S,'Najmanjša vsota:',a)

#print(rev_greedy([(0,0),(7,6), (21,2), (31,5), (9,10), (5,1), (11,37), (6,10)], 3))
