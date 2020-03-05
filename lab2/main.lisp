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
            (CONS ELEM LST) 
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

(SETQ ACAB '(+ * 3 2 5))
(print ACAB)
(PRINT (A ACAB))