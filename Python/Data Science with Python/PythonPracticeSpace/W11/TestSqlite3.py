import sqlite3
with sqlite3.connect('db.sqlite3') as conn:
    c = conn.cursor()
    #c.execute('''
    #    Create Table account(
    #        ID text not null,
    #        PW text not null
    #    )
    #''')

    #c.execute('Insert into account values("Test","1234")')
    
    #c.execute('Update account Set PW="5678" Where ID="Test"')
    
    c.execute('Delete From account Where ID="Test"')
    
    c.execute('Select * From account')
    data = c.fetchall()
    print(data)