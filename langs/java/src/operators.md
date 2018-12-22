Operadores para tipos primitivos
================================

Operadores aritméticos
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

Operadores relacionais
----------------------

Operadores relacionais servem para verificar se alguma relação entre dois
elementos é verdadeira (ou seja, sempre retornarão `true` ou `false`).

| Operador       | Sintaxe     |
|----------------|-------------|
| Igualdade      | `x == y`    |
| Diferença      | `x != y`    |
| Menor que      | `x < y`     |
| Maior que      | `x > y`     |
| Menor ou igual | `x <= y`    |
| Maior ou igual | `x >= y`    |

Operadores unários
------------------

Operadores unários são aqueles que operam por apenas um único dado.

| Operador               | Sintaxe     |
|------------------------|-------------|
| Negação (para números) | `-x`        |
| Incremento             | `++x`       |
| Decremento             | `--x`       |
| Complemento lógico\*   | `!x`        |

\*: O complemento lógico serve para retornar o inverso de um booleano. Ou seja,
se `thing` era verdadeiro, `!thing` é falso.

Outros operadores
-----------------

Neste tutorial estão listados apenas os operadores mais usuais.
Uma lista completa de operadores pode ser vista
[na documentação da Oracle](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/opsummary.html).
