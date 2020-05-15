;; graph
(setq gr '(
        (A (B C))
        (B (A C D G))
        (C (A B D E F))
        (D (B C E G))
        (E (C D F))
        (F (C E))
        (G (B D))
    )
)
;; this methode can find and return direction from nodeName
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
;; this methode check is nodeName in seq
(defun isIn (nodeName seq)
    (cond
        ((EQL nodeName (car seq))
            t
        )
        ((NULL seq)
            nil
        )
        (T
            (isIn nodeName (cdr seq))
        )
    )
)
;; this methode works like 'xor' 
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

;;count
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

;; this methode return grapth without outed node
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

;; inverted car
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

;; revert list
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

;; this methode return list of node like (A B C D E F)
(defun pureNodes (graph)
	(cond 
		((NULL (car graph))
			nil
		)
		(T
		 	(cons (caar graph) (pureNodes (cdr graph)))
		)
	)
)

;; list like ((a b 12) (a c 14) ...)
(defun find_min (weight_list)
    (cond 
        ((NULL weight_list)
            9999
        )
        (T
            (min (cdar weight_list) (find_min (cdr weight_list)))
        )
    )
)
;; (A B) (A C) ...
(defun myfirst (nodeSeq cur seq)
    (cond 
        ((NULL (cdr nodeSeq))
            (cons (cons (car nodeSeq) cur) seq)
        )
        (T
            (myfirst (cdr nodeSeq) cur (cons (cons (car nodeSeq) cur) seq))
        )
    )
)


;; ((A B) (B C) ...)
(defun mysecond (graph  &OPTIONAL(seq nil))
    (cond
        ((NULL (cdr graph))
            (myfirst (getNode (car graph) gr) (car graph) seq)
        )
        (T
            (mysecond (cdr graph) (myfirst (getNode (car graph) gr) (car graph) seq))
        )
    )
)


(defun wisdom_of_ancient (begin end &OPTIONAL(path nil))
    (cond 
        ((isIn begin path)  0)
        ((EQL begin end)    1)
        (T
            (for_each (getNode begin gr) end (function wisdom_of_ancient) (cons begin path))
        )
    )
)


;; ()
(defun for_pair (pair_seq &OPTIONAL(func (function wisdom_of_ancient)))
    (cond 
        ((NULL pair_seq) nil )
        (T
            (cons  
                (cons 
                    (car pair_seq) 
                    (funcall func (caar pair_seq) (cdar pair_seq))
                ) 
                (for_pair (cdr pair_seq) func)
            )
        )
    )
)


(defun for_each (seq end func &OPTIONAL(path nil))
    (cond 
        ((NULL seq) 0)
        (T 
            (+ 
                (for_each (cdr seq) end func path) 
                (funcall func (car seq) end path)
            )
        )
    )
)

(defun start ()
    (for_pair (mysecond (pureNodes gr)) (function wisdom_of_ancient))
)

;; (trace for_each)
;; (trace for_pair)
;; (trace isIn)
(print (start))

(print (find_min (start)))


        ;; date
        DAY 
        MONTH
        YEAR
        ;; time
        MINUTE
        HOUR
        ;; 
        COMPANY
        FROM
        TO
        COST
        ID
        (foreach seq (FUNCTION clear_out))