import itertools

#cycle_gen = itertools.cycle('abcd')
#print(next(cycle_gen)


#rep = itertools.repeat('A',5)
#print(type(rep))

names = ['Justin', 'Monica', 'Irene', 'Pika']
names_groupby = itertools.groupby(names, lambda name: len(name))
print(type(names_groupby))