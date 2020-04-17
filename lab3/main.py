def forall(lst):
    prev = 999999999999
    for key, values in  lst.items():
        for subKey in values:
            prev = min (prev, maxOfI(key, subKey, values, list(key)))
    return prev


def maxOfI(cur, end, gr, seq):
    prev = 0
    for i in gr:
        if(i in seq):
            continue
        if(i == end):
            prev = max(prev,len(seq))

        else: 
            #B          
            seq.append(i) 
            prev = max(prev, maxOfI(i, end, gr, seq))
    return prev    
    

lst = {"a": ("b", "c"),
        "b" : ("a", "c", "d", "g"),
        "c" : ("a", "b", "d", "e", "f"),
        "d" : ("b", "c", "e", "g"),
        "e" : ("c", "d", "f"),
        "f" : ("c", "e"),
        "g" : ("b", "d")}
print(forall(lst))
#print(maxOfI("a", "b", lst, ["a"]))
#print(len("acab"))
