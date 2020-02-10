domains
    god=integer
    name, avtor, pays=string
    
predicates
    d_L(god, name, avtor, pays)
    quest_1(pays)
    
clauses
    d_L(1959, "LISP",       "Маккарти",   "США").
    d_L(1968, "INTER_LISP", "Тейтельман", "США").
    d_L(1968,  "LISP_A",    "Сандевал",   "Швеция").
    d_L(1976,  "VLISP",     "Грюсси",     "Франция").
    d_L(1973,  "LISP 70",   "Тейслер",    "США").
    d_L(1973,  "MLISP-2",   "Смит",       "США").
    d_L(1973,  "QLISP",     "Вильбер",    "США").
    d_L(1974,  "LISPMACHINE LISP","Вайнреб","США").
    d_L(1974,  "MACLISP","Мун","США").
    d_L(1976,  "VLISP","Грюсси","Франция").
    d_L(1979,  "CONCURENT LISP","Мото-Ока","Япония").
    d_L(1982,  "LE_LISP",   "INRIA",      "Франция").
    d_L(1982,  "COMMON LISP",   "Стил", "США").
    d_L(1982,  "GLISP",   "Новак",  "США").

    quest_1(Pays):-
       d_L(_, N1, _, X),
       d_L(_, N2, _, Y),
       X=Y, N1 <> N2, Pays=X.
       
       