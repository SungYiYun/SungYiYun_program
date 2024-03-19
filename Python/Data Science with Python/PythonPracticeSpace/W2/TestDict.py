passwords = {'A':123, 'B':456}
print(passwords)
print(passwords['A'])
print(passwords['B'])

passwords['C'] = 789
print(passwords)
del passwords['C']
print(passwords)

print(passwords.get('C'))
print(passwords.get('C',999))