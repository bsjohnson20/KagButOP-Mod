x = 'Base\Entities\Industry\CTFShops\CTFCosts.cfg'

# load x from config file
with open(x, 'r') as f:
    lines = f.readlines()
    # for every line if it contains an = sign, replace after the = sign with 0
    for i in range(len(lines)):
        if '=' in lines[i]:
            lines[i] = lines[i][0:lines[i].index('=')+1] + '0'
    # write the new config file
with open(x, 'w') as f:
    for row in lines:
        f.write(row+'\n')
    # output finished
print('Finished!')