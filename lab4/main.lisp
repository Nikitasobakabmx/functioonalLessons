;; no str only symbols
(
    DEFSTRUCT flight 
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
)

(setq base ())

(defun give_id(seq)
    (COND
        ((NULL seq)
            1
        )
        (T
            (+ 1 (flight-id (CAR seq)))
        )
    )
)

(defun input_flight(&OPTIONAL(seq nil) (flow t))
    (PROGN
        (SETQ tmp (MAKE-flight))
        (my_print "Введите день")
        (SETF (flight-DAY tmp) (READ flow))
        (my_print "Введите месяц")
        (SETF (flight-MONTH tmp) (READ flow))
        (my_print "Введите Год")
        (SETF (flight-YEAR tmp) (READ flow))
        
        (my_print "Введите Минуты")
        (SETF (flight-MINUTE tmp) (READ flow))
        (my_print "Введите час")
        (SETF (flight-HOUR tmp) (READ flow))
        
        (my_print "Введите транспортную компанию")
        (SETF (flight-COMPANY tmp) (READ flow))
        (my_print "Введите от куда летите")
        (SETF (flight-FROM tmp) (READ flow))
        (my_print "Введите Куда летите")
        (SETF (flight-TO tmp) (READ flow))
        (my_print "Введите цену")
        (SETF (flight-COST tmp) (READ flow))
        (SETF (flight-id tmp) (give_id seq))
        (my_print tmp)
    )
)

(defun put_to (seq struct)
    (cons struct seq)
)
;; (setf base (put_to base (input_flight base)))
(defun drop_from (seq id)
    (REMOVE id seq :TEST (FUNCTION (LAMBDA (loc_id i) (IS_this i loc_id))))
)
;; (setf base (drop_from base (READ)))

(defun Mymerge (a b &OPTIONAL(rubish nil))
    (COND
        ((NULL (flight-DAY a))
            (Mymerge a b (setf (flight-DAY a) (flight-DAY b)))
        )
        ((NULL (flight-MONTH a))
            (Mymerge a b (setf (flight-MONTH a) (flight-MONTH b)))
        )
        ((NULL (flight-YEAR a))
            (Mymerge a b (setf (flight-YEAR a) (flight-YEAR b)))
        )
        ((NULL (flight-MINUTE a))
            (Mymerge a b (setf (flight-MINUTE a) (flight-MINUTE b)))
        )
        ((NULL (flight-HOUR a))
            (Mymerge a b (setf (flight-HOUR a) (flight-HOUR b)))
        )
        ((NULL (flight-COMPANY a))
            (Mymerge a b (setf (flight-COMPANY a) (flight-COMPANY b)))
        )
        ((NULL (flight-FROM a))
            (Mymerge a b (setf (flight-FROM a) (flight-FROM b)))
        )
        ((NULL (flight-To a))
            (Mymerge a b (setf (flight-To a) (flight-To b)))
        )
        ((NULL (flight-COST a))
            (Mymerge a b (setf (flight-COST a) (flight-COST b)))
        )
        (T
            (PROGN 
                (setf (flight-id a) (flight-id b))
                a
            )
        )
    )
)

(defun update_from (seq id)
    (put_to (drop_from seq id) (Mymerge (input_flight) (find_from seq id)))
)
;; (setf seq (update_from seq id))
(defun IS_this (struct id)
    (COND
        ((EQL (flight-ID struct) id)
            T
        )
        (T
            NIL
        )
    )
)

(defun find_from (seq ID)
    (COND
        ((NULL (car seq))
            nil
        )
        ((IS_this (CAR seq) ID)
            (car seq)
        )
        (T
           (find_from (cdr seq) id)
        )
    )
)
(defun my_print(tmp)
    (PROGN
        (terpri )
        (PRINC tmp)
    )
)
(defun clear_out (struct)
    (PROGN
        (my_print (list "День" (flight-DAY struct)))
        (my_print (list "Месяц" (flight-MONTH struct)))
        (my_print (list "Год" (flight-YEAR struct)))
        (my_print (list "Минуты" (flight-MINUTE struct)))
        (my_print (list "Часы" (flight-HOUR struct)))
        (my_print (list "Транспортная компания" (flight-COMPANY struct)))
        (my_print (list "От куда" (flight-FROM struct)))
        (my_print (list "Куда" (flight-TO struct)))
        (my_print (list "Цена" (flight-COST struct)))
        (my_print (list "ID" (flight-id struct)))
        (my_print "________________________________________________")
    )
)

(defun drop ()
    nil
)

(defun earlyer (seq)
    
    (check_year (car seq) (cdr seq) (FUNCTION >))
)
(defun check_year(cur seq func)
    (COND
        ((NULL seq)
            cur
        )
        ((NULL cur)
            seq
        )
        ((funcall func (flight-YEAR (car seq)) (flight-YEAR cur))
            (check_year cur (cdr seq) func)

        )
        ((EQL (flight-YEAR cur) (flight-YEAR (car seq)))
            (check_year (check_month cur (car seq) func) (cdr seq) func)
        )
        (T
            (check_year (car seq) (cdr seq) func)
        )

    )
)
;; (trace check_year)
(defun check_month (cur next func)
    (COND
        ((FUNCALL func (flight-MONTH cur) (flight-MONTH next))
            cur
        )
        ((EQL (flight-MONTH cur) (flight-MONTH next))
            (check_day cur next func)
        )
        (T
            next
        )
    )
)

(defun check_day (cur next func)
    (COND
        ((FUNCALL func (flight-DAY cur) (flight-DAY next))
            cur
        )
        ((EQL (flight-DAY cur) (flight-DAY next))
            (check_hour cur next func)
        )
        (T
            next
        )
    )
)

(defun check_hour (cur next func)
    (COND
        ((FUNCALL func (flight-HOUR cur) (flight-HOUR next))
            cur
        )
        ((EQL (flight-HOUR cur) (flight-HOUR next))
            (check_minute cur next func)
        )
        (T
            next
        )
    )
)
(defun check_minute (cur next func)
    (COND
        ((FUNCALL func (flight-MINUTE cur) (flight-MINUTE next))
            cur
        )
        (T
            next
        )
    )
)
;; (trace check_minute)

(defun late (seq)
    (check_year (car seq) (cdr seq) (FUNCTION <))
)

(defun foreach(seq func &OPTIONAL(rubish nil))
    (COND
        ((NULL (cdr seq))
            (funcall func (car seq))
        )
        (T
            (foreach (cdr seq) func (funcall func (car seq)))
        )

    )
)
;; (trace EQL)
(defun find_from_ (seq dir)
    (COND
        ((NULL (car seq))
            nil
        )
        ((EQL (flight-FROM (car seq)) dir)
            (cons (car seq) (find_from_ (cdr seq) dir))
        )
        (T
            (find_from_ (cdr seq) dir)
        )
    )
)
;; (trace find_from_)

(defun find_to (seq dir)
    (COND
        ((NULL (car seq))
            nil
        )
        ((EQL (flight-TO (car seq)) dir)
            (cons (car seq) (find_to (cdr seq) dir))
        )
        (T
            (find_to (cdr seq) dir)
        )
    )
)
(defun contain (seq)
    (PROGN 
        (setq flow (OPEN "db.haha" :direction :input))
        (setf seq (put_to seq (input_flight seq flow)))
        (setf seq (put_to seq (input_flight seq flow)))
        (setf seq (put_to seq (input_flight seq flow)))
        (setf seq (put_to seq (input_flight seq flow)))
        (setf seq (put_to seq (input_flight seq flow)))
        (CLOSE flow)
        seq
    )
)

(defun main (seq)
    (PROGN
        (my_print "1 - Добавить рейс")
        (my_print "2 - Удалить рейс")
        (my_print "3 - Обновить рейс")
        (my_print "4 - посмотреть рейс")
        (my_print "5 - посмотреть все рейсы")
        (my_print "6 - очистить список")
        (my_print "7 - ближайший рейс")
        (my_print "8 - последний рейс")
        (my_print "9 - Найти рейс из ...")
        (my_print "10 - Найти рейс в ...")
        (my_print "11 - Найти рейс из ... в ...")
        (case (READ)
            (1 (setf seq (put_to seq (input_flight seq))))
            (2 (PROGN
                (my_print "Введите Id рейса")
                (setf seq (drop_from seq (READ)))
                )
            )
            (3(PROGN
                (my_print "Введите Id рейса, затем введите новый, поля который заполнять не стоит заполните как nil")
                (setf seq (update_from seq (READ)))
            )
            )
            (4 
            (PROGN
                (my_print "Введите Id рейса")
                (clear_out(find_from seq (READ))))
            )
            (5 (foreach seq (FUNCTION clear_out)))
            (6 (setf seq (drop)))
            (7 (clear_out(earlyer seq)))
            (8 (clear_out(late seq)))
            (9 (PROGN
                (my_print "Введите от куда летите")
                (find_from_ seq (READ)))
                )
            (10 (PROGN
                (my_print "Введите куда летите")
                (find_to seq (READ)))
            )
            (11 (PROGN
                (my_print "Введите от куда, а потом куда летите")
                (foreach (find_from_ (find_to seq (READ)) (READ)) 
                    (FUNCTION clear_out))
                )
            )
            (T (my_print "вы ошиблись в расчетах"))
        )
        (my_print "Готово")
        (main seq)
    )
)
(setf base (contain base))
(main base)