Operadores para tipos primitivos
================================

Índice
------

1. [Prioridade de Operadores](#prioridade-de-operadores)
2. [Operadores Aritméticos](#operadores-aritméticos)
3. [Operadores Relacionais](#operadores-relacionais)
4. [Operadores Unários](#operadores-unários)
5. [Operadores Lógicos](#operadores-lógicos)
6. [Outros Operadores](#outros-operadores)

Prioridade de Operadores
------------------------

A prioridade dos operadores define em que ordem eles são executados primeiro.
Uma tabela completa se encontra no
[cppreference](https://en.cppreference.com/w/cpp/language/operator_precedence).

Operadores Aritméticos
----------------------

Operadores aritméticos servem para fazer manipulações algébricas. Efetivamente,
somar, dividir, etc.

| Operador      | Sintaxe     |
|---------------|-------------|
| Soma          | `x + y`     |
| Subtração     | `x - y`     |
| Multiplicação | `x * y`     |
| Divisão       | `x / y`     |
| Resto\*       | `x % y`     |

\* É comum encontrar documentações descrevendo o operador `%` como "Módulo". O
problema é que `%` faz **resto da divisão, e não módulo**. A diferença entre
eles é visível nos números negativos:

```text
x:          | -5 | -4 | -3 | -2 | -1 |  0 |  1 |  2 |  3 |  4 |  5 |
x resto 3:  | -2 | -1 |  0 | -2 | -1 |  0 |  1 |  2 |  0 |  1 |  2 |
x módulo 3: |  1 |  2 |  0 |  1 |  2 |  0 |  1 |  2 |  0 |  1 |  2 |
```

Perceba que, diferente do resto da divisão, o "módulo" sempre repete os valores
\[0..N), em que, para a tabela de cima, N seria 3.


Operadores Relacionais
----------------------

Operadores relacionais servem para verificar se uma relação entre dois
elementos é verdadeira.

| Operador       | Sintaxe     |
|----------------|-------------|
| Igualdade      | `x == y`    |
| Diferença      | `x != y`    |
| Menor que      | `x < y`     |
| Maior que      | `x > y`     |
| Menor ou igual | `x <= y`    |
| Maior ou igual | `x >= y`    |


Operadores Unários
------------------

Operadores unários são aqueles que operam por apenas um único dado.

| Operador               | Sintaxe       |
|------------------------|---------------|
| Negação (para números) | `-x`          |
| Incremento             | `++x`         |
| Decremento             | `--x`         |


Operadores Lógicos
------------------

Operadores lógicos trazem o resultado de uma operação booleana.

| Operador               | Sintaxe                       | `true` quando                       |
|------------------------|-------------------------------|-------------------------------------|
| Complemento lógico\*   | `!x` ou `not x`               | `x` é `false`                       |
| "E" lógico             | `x && y`                      | `x` e `y` são `true` ao mesmo tempo |
| "Ou" lógico            | <code>x &#124;&#124; y</code> | `x` ou `y` são `true`               |

\*: O complemento lógico serve para retornar o inverso de um booleano. Ou seja,
se `thing` era verdadeiro, `!thing` é falso. Perceba que esse operador é também
um operador unário.


Outros Operadores
-----------------

Neste tutorial estão listados apenas os operadores mais usuais. Uma lista
completa de operadores pode ser vista [no
cppreference](https://en.cppreference.com/w/cpp/language/operators).
