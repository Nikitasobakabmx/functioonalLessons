 (SETQ LST '( ( K L ) ( M N ) A B C ( D ( E ) ) ) ) 
 (setq K_val '( CAAR LST ))
 (print (EVAL K_val))
 (setq M_val '( CAADR LST))
 (print (Eval M_val))
 (setq E_val '( CAR ( CADADR ( CDDDDR LST ))))
 (print (EVAL E_val))
 (setq D_val '( CAADR ( CDDDDR LST )))   
 (setq N_val '( CADADR LST ))
 (setq A_val '( CADDR LST ))
 (setq list_one '(cons (EVAL K_val) (cons (EVAL D_val) (cons (Eval N_val ) nil))))
 (print (Eval list_one))
 (setq list_two '(cons (EVAL A_val) (cons (Eval D_val) ( cons (eval K_val) nil)))) 
 (print ( Eval list_two))
 (setq tmp '(cons (eval m_val) (cons (eval n_val) nil)))
 (setq list_three '(cons (eval d_val) ( cons (eval tmp) (cons (eval a_val) nil))))
 (print (Eval list_three))