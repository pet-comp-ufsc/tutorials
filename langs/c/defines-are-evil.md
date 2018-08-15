#define são seguros?
====================

Para responder a essa pergunta, vamos primeiramente entender como #defines
funcionam:

```c
#include <stdio.h>
#include <stdlib.h>

#define NUM_VALUES 30
#define MAX 100

int main(void) {
    int values[NUM_VALUES];

    time_t t;
    srand((unsigned)time(&t));
    for (int i = 0; i < NUM_VALUES; ++i) {
        values[i] = rand() % MAX;
    }

    for (int i = 0; i < NUM_VALUES; ++i) {
        printf("values[%d]: %d\n", i, values[i]);
    }
}
```

O código acima (escrito em C) preenche um vetor de 30 inteiros com valores
aleatórios de 0 a 100. Mas o que o #define faz? Ele simplesmente serve para
fazer um "find-replace" durante o pré-processamento, ou seja: **antes de
compilar seu código C**, os trechos em que há o uso do #define são substituídos
pelo que ele define, o que é feito pelo **pré-processador** (chamado "C
Pre-Processor" --- `cpp`). Ou seja, o código acima, após a passada do
pré-processador, se torna:

```c
[... código do stdio.h ...]
[... código do stdlib.h ...]

int main(void) {
    int values[30];

    time_t t;
    srand((unsigned)time(&t));
    for (int i = 0; i < 30; ++i) {
        values[i] = rand() % 100;
    }

    for (int i = 0; i < 30; ++i) {
        printf("values[%d]: %d\n", i, values[i]);
    }
}
```

E esse é o código que é efetivamente compilado (na verdade, quase esse). Parece
um recurso interessante à primeira vista (ao menos para iniciantes), então
vamos brincar de fazer comandos genéricos! Suponha que você queira fazer uma
função que, dados `a` e `b`, retorne o maior deles. Essa função poderia ser:

```c
int max(int a, int b) {
    return a > b ? a : b;
}
```

É simples, porém não é genérico o suficiente: e se for necessário o maior entre
dois floats? Ou doubles? Ou shorts? Seria necessário criar uma função nova para
cada um desses casos, todas elas com os mesmos comandos. Mas #defines não
exigem tipos explícitos (afinal, são "find-replace": não fazem parte da
linguagem, apenas geram código), então um programador ingênuo pensaria em
utilizá-los:

```c
#define MAX(a, b) a > b ? a : b
```

Parece um código bastante inocente, mas na verdade é bastante danoso. Por
exemplo:

```c
#include <stdio.h>

#define MAX(a, b) a > b ? a : b

int main(void) {
    printf("%d\n", 5 * MAX(2, 3));
}
```

Antes de continuar, sem compilar, responda: qual você acredita que será o
resultado? 15? Ou 10? Ou nenhum dos dois?

...
...
...

Se você respondeu "15", você errou. Se você respondeu "10", você também errou!
Compilando e executando o código, o resultado é...

```bash
$ gcc max_test.c -o max_test
$ ./max_test
2
```

Isso mesmo, 2! E perceba que não é a linguagem que está quebrada, mas sim foi
exatamente o que foi descrito no programa. Se você brincar de virar o
pré-processador, vai perceber que o código ficará:

```c
[... código do stdio.h ...]

int main(void) {
    printf("%d\n", 5 * 2 > 3 ? 2 : 3);
}
```

Oras, por razões de intuitividade, faz sentido que em uma comparação do tipo
`(expr) > (expr)`, primeiro a expressão inteira de cada lado seja calculada.
Sendo assim, as duas expressões são `5 * 2` e `3`, e portanto a sequência de
operações é:

```
(5 * 2) > (3)
(10) > (3)
true
```

Sendo assim, é então jogado o resultado para o operador ternário ("?"), que no
código acima indica: se o resultado der verdadeiro, retorne 2, senão, retorne
3. Como 10 é maior que 3, o resultado é verdadeiro, e portanto o ternário cai
no caso "retorne 2".

Mas okay, vamos corrigir o `MAX`. Um programador ingênuo neste momento poderia
pensar em colocar parênteses ao redor da definição dele:

```c
#define MAX(a, b) (a > b ? a : b)
```

Também parece um código inocente, e perceba que ele corrige o problema que
havia antes:

```c
[... código do stdio.h ...]

int main(void) {
    printf("%d\n", 5 * (2 > 3 ? 2 : 3));
}
```

Agora garantidamente o ternário será executado *antes* da multiplicação. Parece
que não temos mais problemas, mas então vamos mais a fundo:

```c
#include <stdio.h>

#define MAX(a, b) (a > b ? a : b)

int foo(void) {
    printf("foo()\n");
    return 10;
}

int bar(void) {
    printf("bar()\n");
    return -1;
}

int main(void) {
    printf("%d\n", MAX(foo(), bar()));
}
```

Mais uma vez, outro código inocente. Mais uma vez, antes de compilar e
executar, qual você acredita ser o resultado desta vez? 10 ou -1?

...
...
...

Se você acreditou em 10, parabéns, você acertou! Mas...ao executar, perceba o
que acontece:

```bash
$ gcc max_test.c -o max_test
$ ./max_test
foo()
bar()
foo()
10
```

Você consegue perceber o problema? Consegue perceber que `foo()` foi chamada
**duas vezes**? Mais uma vez, como #define é um "find-replace", temos um novo
problema:

```c
int main(void) {
    printf("%d\n", MAX(foo(), bar()));
}
```

Vira:

```c
int main(void) {
    printf("%d\n", foo() > bar() ? foo() : bar());
}
```

Ou seja, em vez de aproveitar o resultado de `foo()` ou de `bar()`,
decididamente uma das duas é chamava uma segunda vez.

A correção é, no #define, criar um trecho de código que guarda o resultado das
funções e usa o valor guardado para comparar e retornar (em vez de usar a
chamada da função):

```c
#define MAX(a, b) \
    ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
       _a ? _b : _a : _b; })
```

Compilando e executando:

```bash
$ gcc max_test.c -o max_test
$ ./max_test
foo()
bar()
10
```

Agora sim, sem chamadas extras. E uma macro bastante ilegível. Conclusão:
macros de C (como são chamados os #defines) são inocentes, mas extremamente
inseguras.
