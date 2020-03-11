def forall(lst):
    prev = 999999999999
    for key, _ in lst.items():
        for subKey, subVal in lst.items():
            if(key == subKey):
                continue
            nxt = maxOfI(key, subKey, lst, list(key))
            print(nxt)
            prev = min (nxt, prev)
    return prev


def maxOfI(cur, end, gr, seq):
    prev = 0
    for i in gr[cur]:
        if(i in seq):
            continue
        if(i == end):
            amount = len(seq) + 1
            prev = max(prev, amount)
        else:            
            seq.append(i) 
            prev = max(prev, maxOfI(i, end, gr, seq))
    return prev        

lst = {"a": ("b", "c"),
        "b" : ("a", "b", "c", "d", "g"),
        "c" : ("a", "b", "d", "e", "f"),
        "d" : ("b", "c", "e", "g"),
        "e" : ("c", "d", "f"),
        "f" : ("c", "e"),
        "g" : ("b", "d")}
print(forall(lst))
