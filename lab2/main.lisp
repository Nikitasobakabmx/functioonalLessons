(DEFUN A(LST)
    (B (CAR LST) (CDR LST))
)

(DEFUN B(ELEM LST)
    (COND
        ((EQL ELEM '+) (cons 
                            (B (CAR (UNCDR LST)) (CDR (UNCDR LST))) 
                            (CONS ELEM (cons (UNCAR LST) nil )))
                        )
        ((EQL ELEM '-)(cons 
                            (B (CAR (UNCDR LST)) (CDR (UNCDR LST))) 
                            (CONS ELEM (cons (UNCAR LST) nil )))
                        )
        ((EQL ELEM '*)(cons
                            (B (CAR (UNCDR LST)) (CDR (UNCDR LST))) 
                            (CONS ELEM (cons (UNCAR LST) nil )))
                        )
        ((EQL ELEM '/)(cons
                            (B (CAR (UNCDR LST)) (CDR (UNCDR LST))) 
                            (CONS ELEM (cons (UNCAR LST) nil )))
                        )
        (T
            (CONS ELEM NIL)
        )
    )
)
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

(DEFUN UNCDR(LST)
    (COND
        ((NULL (CDR LST)) 
            nil
        )
        (T 
            (CONS (CAR LST) (UNCDR ( CDR LST)))
        )
    )
)

(SETQ test '(- * 5 6 3))
(print test)
(PRINT (A test))