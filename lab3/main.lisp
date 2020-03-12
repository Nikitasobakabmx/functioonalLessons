(setq gr '(
        (A (B C))
        (B (A B C D G))
        (C (A B D E F))
        (D (B C E G))
        (E (C D F))
        (F (C E))
        (G (B D))
    )
)

(defun getNode (nodeName graph)
    (cond 
        ((EQL (caar graph) nodeName)
            (cadar graph)
        )
        ((NULL (caar graph))
            nil
        )
        (T
            (getNode nodeName (cdr graph))
        )
    )
)
(defun isIn (nodeName seq)
    (cond
        ((EQL nodeName (car seq))
            t
        )
        ((NULL (car seq))
            nil
        )
        (T
            (isIn nodeName (cdr seq))
        )
    )
)
(defun unRepid (fork seq)
    (cond
        ((NULL (car fork))
            nil
        ) 
        (T
            (cond 
                ((isIn (car fork) seq) 
                    (unRepid (cdr fork) seq)
                )
                (T
                    (cons (car fork) (unRepid (cdr fork) seq))
                )
            )
        )
    )
)
(print (cons '(getNode) (getNode 'A gr)))
(print (list '(isIn) (isIn 'A '(A C A B))))
(print (cons '(unRepid)(unRepid '(A C D A) '(A B C))))

(defun myCount (arrayList &OPTIONAL (tmp 0))
    (cond
        ((NULL (car arrayList))
            tmp
        )
        (T
            (myCount (cdr arrayList) (+ tmp 1))
        )
    )
)

(defun snatch (lst outed)
    (cond
        ((NULL (car lst))
            nil
        )
        ((EQL (caar lst) outed)
            (snatch (cdr lst) outed)
        )
        (T
            (cons (car lst) (snatch (cdr lst) outed))
        )
    )
)

(print (cons '(snatch) (snatch gr 'B)))
(print (cons '(myCount) (myCount '(A C A B))))

(DEFUN UNCAR(LST)
    (COND
        ((NULL (CDR LST))
            (CAR LST)
        )
        (T
            (UNCAR (CDR LST))
        )
    )
)
(defun revert(lst)
    (cond
        ((NULL (cdr lst))
            lst
        )
        (T
            (append (revert (cdr lst)) (cons (car lst) nil))
        )
    )
)
(print (cons '(revert) (revert '(A C A B))))



;; maxOfI
(defun start (begin end gr seq)
    (forEach (unRepid (getNode begin gr) seq) (function (lambda (i)(conditions i end gr seq))))
)

(defun conditions (begin end gr seq)
    (cond
        ((EQL begin end)
            (myCount seq)
        )
        ((NULL begin)
            0
        )
        (T
            (start begin end gr (append seq (cons begin nil) ))
        )
    )
)

(defun forEach (seq func)
    (cond
        ((ATOM seq)
            (funcall func seq)
        )
        ((NULL (cdr seq))
            (funcall func (car seq))
        )
        (T
            (max (forEach (cdr seq) func) (funcall func (car seq)))
        )
    )
)
;; // maxOfI
(trace start)
(trace unRepid)
(trace forEach)
(trace conditions)
(print (start 'A 'B gr '(A)))
