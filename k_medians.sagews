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
tocke = [(random.random()*10, random.random()*10) for x in range(10)]
k=3
#s=[]
#for t in tocke:
#    for u in tocke:
#        s.append(razdalja(t,u))
#print(s)
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
#print(x)
mnozice = {tocke[i]: tocke[j] for (i, j), v in res1.items() if v > 0}
#print(mnozice)
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
mnozice
clusters
centri
sum(razdalja(i,j) for i,j in mnozice.items())

︡7327ce8e-4f21-41c0-98c4-e5fbb3d9b23f︡{"stdout":"22.25514455412774\n"}︡{"stdout":"{(8.07900373078034, 2.8503536843305155): (6.468738283915162, 2.177182790894552), (5.221774301782185, 1.4154185887827297): (6.468738283915162, 2.177182790894552), (8.607652625364134, 3.307555892865305): (6.468738283915162, 2.177182790894552), (1.5031368482724627, 4.937119030011865): (1.5031368482724627, 4.937119030011865), (9.37845326451002, 7.49295241005564): (6.788409391691825, 6.330573773433386), (6.788409391691825, 6.330573773433386): (6.788409391691825, 6.330573773433386), (2.4572908873016175, 1.9886242064761905): (1.5031368482724627, 4.937119030011865), (4.1393134474668445, 4.524431087711215): (1.5031368482724627, 4.937119030011865), (5.0453449997504105, 8.577266054153734): (6.788409391691825, 6.330573773433386), (6.468738283915162, 2.177182790894552): (6.468738283915162, 2.177182790894552)}\n"}︡{"stdout":"[[(9.37845326451002, 7.49295241005564), (6.788409391691825, 6.330573773433386), (5.0453449997504105, 8.577266054153734)], [(1.5031368482724627, 4.937119030011865), (2.4572908873016175, 1.9886242064761905), (4.1393134474668445, 4.524431087711215)], [(8.07900373078034, 2.8503536843305155), (5.221774301782185, 1.4154185887827297), (8.607652625364134, 3.307555892865305), (6.468738283915162, 2.177182790894552)]]\n"}︡{"stdout":"[(6.788409391691825, 6.330573773433386), (1.5031368482724627, 4.937119030011865), (6.468738283915162, 2.177182790894552)]\n"}︡{"stdout":"22.25514455412774\n"}︡{"done":true}︡










