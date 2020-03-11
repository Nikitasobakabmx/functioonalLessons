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
            (cdar graph)
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

(defun gogo (seq gr derect amount forks prev)
        (forEach (unRepid forks seq) (function (lambda (x) (derect seq gr amount prev x))))
)

(defun acab (derect seq gr amount cur next)
    (cond
        ((EQL (UNCAR seq) derect)
            (+ amount 1)
        )
        (T
            (gogo (append seq cur) gr derect (+ amount 1) (getNode next))
        )

    )
)
(defun forEach (seq func)
    (cond 
        ((NULL (car seq))
            
        )
        
    )
)

;; ;; (defun degree (deCon graph)
;; ;;     (cond
;; ;;         ((NULL (car graph))
;; ;;             nil
;; ;;         )
;; ;;         (T
;; ;;             (degree (fork (cdar graph) (cdr graph) (caadr graph) (cons (caar graph) nil) (cdr graph))
;; ;;         )

;; ;;     )
;; ;; )

;; ;; (defun findMinPath(forks graph destenation seq amount)
;; ;;     (cond
;; ;;         ((isIn destenation forks)
;; ;;             (+ amount 1) 
;; ;;         )
;;         (NULL (car forks)
;;             ()
;;         )
;;         (T
            
;;         )
;;     )
;; )

;; (defun forEach (seq lambdaFunction)
;;     (cond
;;         ((NULL seq)
;;             nil
;;         )
;;         (T
;;             (lambdaFunction ca)
;;         )

;;     )
;; )
