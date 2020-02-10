/*   Программа:  Эксперт по породам собак                          */
/*   Файл:       Prim1.pro                                                            */
/*   Назначение: Демонстрация работы экспертной             */
/*              системы. Это продукционная система,                 */
/*              базирующаяся на правилах                                    */
/*   Замечание:  Это система для идентификации породы   */
/*             собак. Система использует множество                  */
/*             продукционных правил для вывода                       */
/*             решения                                                                     */

     domains
     database
          xpositive (symbol)
          xnegative (symbol)
     predicates
          do_expert
          consulting
          in_out (symbol)
          dog (symbol)
          priznak (symbol)
          negative (symbol)
          remember (symbol,symbol)
          clear_facts
     goal
          do_expert.
          
     clauses
          /* Система пользовательского интерфейса (СПИ) */
     do_expert :-
          makewindow (1,112,6,"ЭКСПЕРТНАЯ СИСТЕМА",1,12,22,58),
          nl,write ("         * * * * * * * * * * * * * * * * * *  * * * * *"),
          nl,write ("         *         ВЫБОР ПОРОДЫ СОБАК          *"),
          nl,write ("         *                                                                  *"),
          nl,write ("         *          В Н И М А Н И Е !                        *"),
          nl,write ("         *                                                                   *"),
          nl,write ("         *   Пpи ответе на вопpосы набиpайте     *"),
          nl,write ("         *              'yes' или  'no'.                              *"),
          nl,write ("         * * * * * * * * * * * * * * * * * * * * ** * *"),
          nl,nl,
          consulting,
          write ("Нажмите любую клавишу ."),nl,
          readchar (_),
          removewindow,
          exit.
     consulting :- 
          dog (X),!,nl,
          write ("        Собака имеет поpоду : ",X,"."),nl,
          clear_facts.
     consulting :-
          nl,write ("        Пpостите, я не могу Вам помочь ! "),
          clear_facts.
     in_out (Y) :- 
          write ("      Вопpос :- Собака имеет ",Y," ?"),
          readln (Reply),
          remember (Y,Reply).
               
          /*         МЕХАНИЗМ  ВЫВОДА          */
     priznak (Y) :-
          xpositive (Y),!.      
     priznak (Y) :-
          not (negative (Y)),
          in_out (Y).
     negative (Y) :-
          xnegative (Y).
     remember (Y,yes) :-
          asserta (xpositive (Y)).
     remember (Y,no) :-
          asserta (xnegative (Y)),
          fail.
     clear_facts :-
          retract (xnegative (_)),
          fail.
     clear_facts :-
          retract (xpositive (_)),
          fail.
                                         
          /*     ПРОДУКЦИОННЫЕ  ПРАВИЛА        */
          
     dog ("Английский бульдог") :-
          priznak ("шеpсть коpоткую"),
          priznak ("pост меньше 50 см"),
          priznak ("хвост низкопосаженный"),
          priznak ("хаpактеp хоpоший"),!.
     dog ("Гончая") :-
          priznak ("шеpсть коpоткую"),
          priznak ("pост меньше 50 см"),
          priznak ("уши длинные"),
          priznak ("хаpактеp хоpоший"),!.
  /*   dog ("Дог") :-
          priznak ("шеpсть коpткую"),
          priznak ("),
          positive (has,"good natured personality"),
          positive (has,"weight over 100 lb"),!.
     dog_is ("American Foxhound") :-
          it_is ("short-haired dog"),
          positive (has,"heigtht under 30 inches"),
          positive (has,"longer ears"),
          positive (has,"good natured personality"),!.
     dog_is ("Cocker Spaniel") :-
          it_is ("long-haired dog"),
          positive (has,"height under 22 inches"),
          positive (has,"low-set teil"),
          positive (has,"longer ears"),
          positive (has,"good natured personality"),!.
     dog_is ("Irish Setter") :-
          it_is ("long-haired dog"),
          positive (has,"height under 30 inches"),
          positive (has,"longer ears"),!.
     dog_is ("Collie") :-
          it_is ("long-haired dog"),
          positive (has,"height under 30 inches"),
          positive (has,"low-set tail"),
          positive (has,"good natured personality"),!.
     dog_is ("St. Bernard") :-
          it_is ("long-haired dog"),
          positive (has,"low-set tail"),
          positive (has,"good natured personality"),
          positive (has,"weight over 100 lb"),!. */
 /*     it_is ("шеpсть коpоткую") :-
          positive ("шеpсть коpоткую"),!.
        it_is ("long-haired dog") :-
          positive (has,"long-haired"),!. */	
                                                  
     /*   КОНЕЦ  ПРОГРАММЫ    */               

