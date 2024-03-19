import pickle

data = [1,2,3]
pickled = pickle.dumps(data)
print(data)
print(pickled)

print(pickle.loads(pickled))

with open('data.pickle', 'wb') as f:
    pickle.dump(data,f)

with open('data.pickle', 'rb') as f:
    print(pickle.load(file=f))