Aritmética - Detalhes
=====================

Índice
------

1. [Prioridade de operadores](#prioridade-de-operadores)
2. [Aritmética entre inteiros](#aritmética-entre-inteiros)
3. [Aritmética entre tipos diferentes](#aritmética-entre-tipos-diferentes)

Prioridade de operadores
------------------------

Suponha o seguinte trecho de código:

```java
var x = 16 / 8 * (4 / 2);
```

Qual será o valor de `x` após executá-lo? Será 2 ou 1? Que operação é feita
primeiro?

Em Java, a ordem pela qual as operações são resolvidas é:

1. Parênteses;
2. Multiplicações e Divisões, na ordem em que aparecerem;
3. Somas e subtrações, na ordem em que aparecerem.
4. Operações relacionais (`>`, `<`, `==`, `!=`, `<=`, `>=`);

No caso do trecho acima, a sequência seria:

1. `16 / 8` (= 2, ficando `2 * (4 / 2)`);
2. `(4 / 2)` (= 2, ficando `2 * 2`);
3. `2 * 2` (= 4).

Ou seja, o valor final de x é 4.

Para aninhar operações, é necessário colocar mais parênteses internamente. Por
exemplo:

```java
var y = 2 + (4 * (2 - 8));
```

Assim, `2 - 8` será executado antes de `4 * ...`, que será executado antes de
`2 + ...`.

Quanto a operadores relacionais, para serem intuitivos, eles possuem menor
prioridade para serem resolvidos. Ou seja, se for escrito:

```java
var z = x - 2 > 1;
```

O valor de `z` será calculado na ordem:

1. `x - 2`;
2. `> 3`.

Assim, a comparação fica intuitiva: `x - 2` é maior que 1? Considerando `x = 4`
como anteriormente, o valor de `z` será `true`.

Aritmética entre inteiros
-------------------------

Tratando-se de operações entre dois inteiros, boa parte dos operadores é
intuitivo. Porém, qual será o resultado quando é feito `5 / 7`, por exemplo? É
`0.714...`?

Para responder a isso, devemos saber que **operações entre inteiros sempre
resultam em inteiros**. Ou seja, não é possível que `5` (que é um inteiro)
divido por `7` (que é outro inteiro) resulte em `0.714...`, que é um número
real! O que se faz, na prática, é contar quantas vezes é necessário multiplicar
`7` para se chegar em pelo menos `5`. Como `7` já é maior que `5`, então é
necessário multiplicar um total de `0` vezes. No final, isso é equivalente a
ignorar os números após a vírgula, que é o que chamamos de **truncar**.

Sendo assim, `5 / 7` é `0` (ignora-se o `.714...`), `3 / 2` é `1` (ignora-se o
`.5`), e por aí vai.


Aritmética entre tipos diferentes
---------------------------------

Considerando o caso visto acima em
[Aritmética entre inteiros](#aritmética-entre-inteiros), e se for necessário
que o resultado seja um número real? Para isso, basta que **pelo menos um dos
operandos** seja um número real (ou seja, `float` ou `double`).

Sendo assim, basta fazer `5.0 / 7` ou `5 / 7.0`. Isso se dá porque a
preferência é sempre converter os valores para o tipo mais abrangente. Nesse
caso, consideramos do menos abrangente ao mais abrangente:

1. Byte;
2. Short;
3. Int;
4. Long;
5. Float;
6. Double.

Recomendações de Leitura
------------------------

1. [Operadores em Java](/langs/java/operators.md)
2. [Por que não utilizar float e double para representar dinheiro?](https://stackoverflow.com/a/3730040/3326309)
