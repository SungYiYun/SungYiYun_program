import json
obj = {'A': 'a','B':1,'C':True}
#print(obj)

#print(json.dumps(obj))

obj2 = json.dumps(obj)
print(obj2)
obj = json.loads(obj2)
print(obj)

with open('data.json','w') as f:
    json.dump(obj,f)
