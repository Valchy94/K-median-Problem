︠cfd3e068-b172-445c-96c6-d39bd44bc071︠
import random
def razdalja(x,y):
    return abs(x[0]-y[0])+abs(x[1]-y[1])
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
p.set_objective(sum(sum(x[i][j]*razdalja(i, j) for j in range(n)) for i in range(n)))
for i in range(n):
    p.add_constraint(sum(x[i][j] for j in range(n))==1)
p.add_constraint(sum(y[j] for j in range(n)) <= k)
for j in range(n):
    for i in range(n):
        p.add_constraint(x[i][j]-y[j]<=1)
p.solve()
res1 = p.get_values(x)
#res2 = p.get_values(y)
#print(x)
mnozice = {i: j for (i, j), v in res1.items() if v > 0}
#print(mnozice)
centri = [j for j, v in res2.items() if v > 0]
centri
mnozice
sum(razdalja(i, j) for i,j in mnozice.items())

︡6e4cc8f1-7fdc-44de-9716-28a5806b06b0︡{"stderr":"Error in lines 10-10\nTraceback (most recent call last):\n  File \"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 982, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/sage/misc/functional.py\", line 565, in symbolic_sum\n    return sum(expression, *args)\n  File \"\", line 1, in <genexpr>\n  File \"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/sage/misc/functional.py\", line 565, in symbolic_sum\n    return sum(expression, *args)\n  File \"\", line 1, in <genexpr>\nTypeError: 'sage.numerical.linear_functions.LinearFunction' object has no attribute '__getitem__'\n"}︡{"done":true}︡










