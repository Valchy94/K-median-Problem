#Forward Greedy algoritem: Ideja je, da imamo S_t množico (v mojem primeru bo to seznam)
#centrov na koraku t. V (t+1) koraku dodamo množici S tisto točko,
# s katero je cena(S_(t+1)) najmanjša, dokler ni |S| = k.

#Najprej potrebujemo manhattansko razdaljo:
def razdalja(x,y):
    #print(x, y)
    if type(x) is not tuple or type(y) is not tuple:
        return abs(y - x)
    if len(x) != len(y):
        return False
    else:
        n=len(x)
        vsota=0
        for i in range(n):
            vsota+=abs(x[i]-y[i])
    return vsota
#Zdaj definiramo funkcijo cena:
def cena(S, tocke):
    v=0
    for t in tocke:          #gremo po vseh točkah gledat v kateri center bi najbolj pasale
        a=razdalja(t, S[0])  #nastavila sem prvo vrednost a
        j=0
        while j<len(S):
            if razdalja(t,S[j]) < a:
                a=razdalja(t,S[j])
            j+=1
        v+=a
    return v

#Končno definiramo še funkcijo, ki nam reši naš problem:
def fw_greedy(tocke, k):
    S=[] #seznam centrov
    tocke_st=tocke
    #print(tocke_st)
    indeksi=[]
    while len(S)<k:
        a=cena(S+[tocke[0]], tocke[1:])   #nastavimo vrednost cene, če v S dodamo prvo točko
        j=0
        i=0
        while j<len(tocke):
            S1 = S+[tocke[j]]
            tocke1 = tocke[:j]+tocke[j+1:]
            if cena(S1, tocke1) < a:
                a=cena(S1, tocke1)
                i=j  #v i sem shranila indeks trenutnega najboljšega kandidata za center
            j+=1
        S=S+[tocke[i]]
        n = tocke_st.index(tocke[i])  #vrne indeks prve pojavitve elementa tocke[i] v seznamu tocke_st
        indeksi+=[n]
        tocke = tocke[:i] + tocke[i+1:]
    a=cena(S, tocke)

    return a #, S      #Vrne končno vsoto in pa seznam centrov, če želimo (če to želimo, odkomentiramo vejico in S



