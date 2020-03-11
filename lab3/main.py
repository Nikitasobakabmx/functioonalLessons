
print("start")
def forall(lst):
    prev = 999999999999
    for key, val in lst:
        for subKey, subVal in lst:
            if(key == subkey):
                pass
            nxt = maxOfI(key, subVal, gr, [], 0)
            prev = min (nxt, prev)
    return prev

def maxOfI(cur, end, gr, seq, amount):
    prev = 0
    for i in gr[cur]:
        if(i is in seq):
            continue
        if(i == end):
            amount += 1
            prev = max(prev, amount)
        else:
            prev = max(prev, maxOfI (i, end, gr, seq + i, amount + 1))
    return prev        

lst = {"a": ("b", "c"),
        "b" : ("a", "b", "c", "d", "g"),
        "c" : ("a", "b", "d", "e", "f"),
        "d" : ("b", "c", "e", "g"),
        "e" : ("c", "d", "f"),
        "f" : ("c", "e"),
        "g" : ("b", "d")}
print("acab")
print(forall(lst))