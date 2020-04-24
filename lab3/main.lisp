;;
(defun start (begin end gr seq)
    (forEach (unRepid (getNode begin gr) seq) (function (lambda (i)(myconditions i end gr seq))) (function max))
)


;; this methode find path from begin to end ;; seq is uniq
(defun myconditions (begin end gr seq)
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

;; for each element of seq, apply minMaxFun for all and func for each elem
(defun forEach (seq func &OPTIONAL (minMaxFun (function +) ))
    (cond
        ((ATOM seq)
            (funcall func seq)
        )
        ((NULL (cdr seq))
            (funcall func (car seq))
        )
        (T
            (funcall minMaxFun (forEach (cdr seq) func minMaxFun) (funcall func (car seq)))
        )
    )
)


;; sobsna start

(defun __init__ (graph)
	(forEach 
	    (pureNodes graph) 
	    (function
	    	(lambda (i) 
                (ForEach 
			        (pureNodes (snatch graph i))
				    (function
                        (lambda (k) 
				         (start 
				            i 
				          k 
				          graph 
				          (cons i nil)
				         )
				        )
                    )
				    (function min)
		        )
		    )
	   ) 
	   (function min)
	)
)
;; // maxOfI
;; (trace start)
;;(trace unRepid)
;;(trace forEach)
;;(trace start)
;; (print (start 'A 'B gr '(A)))
(print (cons '(__init__) (__init__ gr)))
