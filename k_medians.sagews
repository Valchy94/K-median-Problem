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
sum(razdalja(tocke[i], tocke[j]) for i,j in mnozice.items())

︡bc6ef614-d91b-48dd-9187-8e80f09947bc︡{"stdout":"19.544395385502796\n"}︡{"stdout":"{(5.241801112355553, 2.499805758035504): (4.718777080926278, 3.0104792415574155), (6.238826244830622, 9.799793365057306): (6.238826244830622, 9.799793365057306), (0.2758743041616718, 2.8648336178018363): (4.718777080926278, 3.0104792415574155), (9.489216473104195, 0.25766953732141884): (9.489216473104195, 0.25766953732141884), (9.57498978396774, 2.9431053828446396): (9.489216473104195, 0.25766953732141884), (3.5100481040261453, 5.927724016851011): (4.718777080926278, 3.0104792415574155), (4.718777080926278, 3.0104792415574155): (4.718777080926278, 3.0104792415574155), (9.93140050670098, 0.4526815570072018): (9.489216473104195, 0.25766953732141884), (6.976172600417123, 7.619347239215357): (6.238826244830622, 9.799793365057306), (3.062075644098262, 9.506565939049754): (6.238826244830622, 9.799793365057306)}\n"}︡{"stdout":"[[(9.489216473104195, 0.25766953732141884), (9.57498978396774, 2.9431053828446396), (9.93140050670098, 0.4526815570072018)], [(6.238826244830622, 9.799793365057306), (6.976172600417123, 7.619347239215357), (3.062075644098262, 9.506565939049754)], [(5.241801112355553, 2.499805758035504), (0.2758743041616718, 2.8648336178018363), (3.5100481040261453, 5.927724016851011), (4.718777080926278, 3.0104792415574155)]]\n"}︡{"stdout":"[(9.489216473104195, 0.25766953732141884), (6.238826244830622, 9.799793365057306), (4.718777080926278, 3.0104792415574155)]\n"}︡{"stderr":"Error in lines 42-42\nTraceback (most recent call last):\n  File \"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 982, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/sage/misc/functional.py\", line 565, in symbolic_sum\n    return sum(expression, *args)\n  File \"\", line 1, in <genexpr>\nTypeError: list indices must be integers, not tuple\n"}︡{"done":true}︡










