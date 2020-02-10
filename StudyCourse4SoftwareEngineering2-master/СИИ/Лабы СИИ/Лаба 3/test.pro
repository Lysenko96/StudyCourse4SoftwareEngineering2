/*   Программа:  Эксперт по диагнозам                         */
/*   Файл:       test.pro                                                            */
/*   Назначение: Демонстрация работы экспертной             */
/*              системы. Это продукционная система,                 */
/*              базирующаяся на правилах                                    */
/*   Замечание:  Это система для идентификации диагноза.   */
/*              Система использует множество                  */
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
          /* Система пользовательского интерфейса */
     do_expert :-
          makewindow (1,112,6,"ЭКСПЕРТНАЯ СИСТЕМА",1,12,22,58),
          nl,write ("         * * * * * * * * * * * * * * * * * *  * * * * *"),
          nl,write ("         *         ВЫБОР Диагноза         *"),
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
          write ("        Диагноз  : ",X,"."),nl,
          clear_facts.
     consulting :-
          nl,write ("        Пpостите, я не могу Вам помочь ! "),
          clear_facts.
     in_out (Y) :- 
          write ("      Вопpос :- Диагноз имеет ",Y," ?"),
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
          
	diagnoz(«Депрессия»)
	priznak(«тип боли эмоциональная»)

	diagnoz(«Перелом»)
	priznak(«тип боли физическая»)
	priznak(«тупая»)
	priznak(«нарушена костная структура»)
	
	diagnoz(«Гематома или порваны связки»)
	priznak(«тип боли физическая»)
	priznak(«тупая»)
	priznak(«не нарушена костная структура»)

	diagnoz(«Грипп или простуда»)
	priznak(«тип боли физическая»)
	priznak(«острая»)
	priznak(«обморожение»)

	diagnoz(«Ожоги»)
	priznak(«тип боли физическая»)
	priznak(«острая»)
	priznak(«ущерб кожи»)

          
     /*  и т. д. */
                                                  
     /*   КОНЕЦ  ПРОГРАММЫ    */               

