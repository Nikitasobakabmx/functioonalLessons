def forall(lst):
    prev = 999999999999
    for key, _ in lst.items():
        for subKey, subVal in lst.items():
            if(key == subKey):
                continue
            nxt = maxOfI(key, subKey, lst, list(key))

            prev = min (nxt, prev)
    return prev


def maxOfI(cur, end, gr, seq):
    prev = 0
    for i in gr[cur]:
        if(i in seq):
            continue
        if(i == end):
            #1A
            print("Hello")
            amount = len(seq)
            prev = max(prev, amount)
        else: 
            #B          
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
#print(forall(lst))
print(maxOfI("a", "b", lst, ["a"]))
print(len("acab"))