# unam_compiladores
Proyecto de compilador C-- para la clase de compiladores con Ulises Mercado

Hola, 

En este proyecto intentamos elaborar un compilador para el lenguaje C −− (definido más adelante), que realizará una traducción 
a codigo objeto a una máquina hipotética para esto usamos las herramientas flex y yacc.

Gramática.

1. programa → lista declaraciones

2. lista declaraciones → lista declaraciones declaracion | declaracion

3. declaracion → declaracion variables | declaracion funcion | tipo struct

4. declaracion variables → tipo lista variables;

5. lista variables → lista variables , lista | lista

6. lista → id arreglo

7. arreglo → [numero] arreglo | ε

8. tipo → int | float | double | char | void | tipo struct

9. tipo struct → struct id { cuerpo struct } | struct { cuerpo struct } | struct id

10. cuerpo struct → cuerpo struct declaracion variables | declaracion variables

11. declaracion funcion → tipo id( parametros ) bloque

12. parametros → lista parametros | void

13. lista parametros → lista parametros , parametro | parametro

14. parametro → tipo id arrparam

15. arrparam → [ ] arrparam | ε

16. bloque → { delcaraciones locales lista sentencias }

17. declaraciones locales → declaraciones locales declaracion variables | ε

18. lista sentencias → lista sentencias sentencia | ε

19. sentencia → sentencia exp | sentencia if | sentencia while | sentencia do | sentencia switch |

sentencia for | sentencia break | sentencia return | bloque | sentencia imprime | sentencia lee

20. sentencia exp → expresion; | ;

21. sentencia if → if( expresion ) sentencia sentencia else

22. sentencia else → else sentencia | ε

23. sentencia while→ while( expresion ) sentencia

24. sentencia do → do sentencia while(expresion );

25. sentencia switch → switch(id){ lista casos case default }

26. lista casos → lista casos sentencia case | sentencia case

27. sentecia case → case entero: sentencia sentencia break

4

28. case defualt → default: sentencia sentencia break | ε

29. sentencia for → for( expresion ; expresion ; sentencia incremento ) sentencia

30. sentencia break → break;

31. sentencia incremento → id++ | id- -

32. sentencia imprime → print( expresion );

33. sentencia lee → scan(id);

34. sentencia return → return; | return expresion ;

35. expresion → variable operador asignacion expresion | expresion simple

36. operador asignacion → = | += | -= | *= | /= | %=

37. variable → id vararrg | id.id

38. vararrg → [ expresion ] vararrg | ε

39. expresion simple → expresion simple operador relacional operando | expresion simple oper-
ador logico operando | operando

40. operado logico → && | ||

41. operador relacional → <= | >= | < | > | == | ! =

42. operando → operando operador adicion termino | termino

43. oprador adicion → + | -

44. termino → termino operador mul factor | factor

45. operador mul → * | / | %

46. factor → variable | llamada | ( expresion ) | entero | flotante | caracter | cadena |

dobleprecision | !expresion | -expresion

47. llamada → id( argumentos )

48. argumentos → lista argumentos | ε

49. lista argumentos → lista argumentos , expresion | expresion
