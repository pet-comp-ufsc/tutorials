C# para programadores C
=======================

Básicos
-------

Se você veio de C e sabe somente C, prepare-se para o mundo novo da Orientação
a Objetos. A maior diferença notável entre instâncias de `struct`s de C e
objetos de C# é o fato de que objetos possuem métodos (i.e.
funções do próprio objeto). No caso específico de Java, C# e Cobra, toda função
é uma função-membro, ou seja, não existe função "solta", todas elas precisam
estar dentro de uma classe. Isso inclui também a função main(), visto que, em
C, um Hello World seria:

```c
#include <stdio.h>

int main(void) {
    printf("Hello, world!\n");
    return 0;
}
```

Enquanto que em C# seria:

```cs
using System;

public class INeedAClassForEverything {
    public static void Main() {
        Console.WriteLine("Hello, world!");
    }
}
```

Um pouco mais comprido, sim, devido principalmente à decisão de projeto da
linguagem de que tudo precisa estar em uma classe. Bem, acostume-se.

Há várias construções que são quase iguais em ambas as linguagens, por exemplo,
o que em C seria:

```c
int sum = 0;
for (int i = 0; i < 10; ++i) {
    sum += 1;
}

printf("Sum: %d\n", sum);

if (sum > 20) {
    printf("Sum is bigger than 20\n");
} else if (sum > 10) {
    printf("Sum is between 10 and 20\n");
} else {
    printf("Sum is less/equal 10\n");
}
```

Em C# ficaria:

```cs
int sum = 0;
for (int i = 0; i < 10; i++) {
    sum += i;
}

Console.WriteLine(string.Format("Sum: {0}", sum));

if (sum > 20) {
    Console.WriteLine("Sum is bigger than 20");
} else if (sum > 10) {
    Console.WriteLine("Sum is between 10 and 20");
} else {
    Console.WriteLine("Sum is less/equal 10");
}
```

Note o {0} em String.Format. 0 é o índice do parâmetro a ser substituído ali.
Exemplo:

```cs
String.Format("{0} {1} {2} {3}", 1, true, 3.14f, Console.In);
```

Irá retornar uma String com:

```
1 true 3.14 SystemIO.Reader+NullStreamReader
```

Note também que foi possível colocar um `Console.In` na formatação de String, o
que resultou em um texto estranho (`SystemIO.Reader+NullStreamReader`).  Isso
se dá porque o string.Format na verdade só chama o método `ToString()` de cada
parâmetro, o que em alguns casos o padrão é mostrar o tipo do objeto. Métodos
serão vistos melhor mais a frente.

Uma pequena tabela mostrando um pouco do que há em C de diferente/igual a C#:

| Recurso          | C   | C#                                                   |
| -----------------|-----|------------------------------------------------------|
| Ponteiros        | Sim | Não¹                                                 |
| Classes/Objetos  | Não | Sim                                                  |
| Structs          | Sim | Structs são ValueTypes², Classes são ReferenceTypes³ |
| Macros           | Sim | Sim⁴                                                 |
| Namespaces       | Não | Sim                                                  |
| Function-pointer | Sim | Possui Delegates e Events                            |

¹: Na verdade sim, mas não funcionam da mesma forma. Explicado mais adiante em
   [Não tenho ponteiros. E agora?](#não-tenho-ponteiros-e-agora).
²: [ValueTypes](https://msdn.microsoft.com/en-us/library/s1ax56ch.aspx)
³: [ReferenceTypes](https://msdn.microsoft.com/en-us/library/490f96s2.aspx)
⁴: C# tem macros, mas não da mesma forma que C: elas apenas definem símbolos
   que podem ser utilizados em `#ifndef`, por exemplo, mas não servem para
   definir constantes.
