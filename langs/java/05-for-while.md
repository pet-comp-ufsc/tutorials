Estruturas de repetição `for` e `while`
=======================================

Índice
------

1. [Motivação](#motivação)
2. [Termos](#termos)
3. [Estrutura `for`](#estrutura-for)
   1. [Sintaxe de um `for`](#sintaxe-de-um-for)
   2. [Funcionamento detalhado (passo a passo)](#funcionamento-detalhado-(passo-a-passo))
   3. [Adaptando para a listagem de pares de 0 a 10](#adaptando-para-a-listagem-de-pares-de-0-a-10)
4. [Estrutura `while`](#estrutura-while)
   1. [Sintaxe de um `while`](#sintaxe-de-um-while)
   2. [Exemplo de `while`: calcular raíz quadrada](#exemplo-de-while-calcular-raíz-quadrada)
5. [Interrompendo estruturas de repetição](#interrompendo-estruturas-de-repetição)
6. [Pulando uma iteração](#pulando-uma-iteração)
7. [Recomendações de leitura](#recomendações-de-leitura)


Motivação
---------

Em dados momentos de um programa, é necessário repetir uma mesma sequência de
comandos em seu programa. Algumas dessas repetições serão porque há uma
condição a ser quebrada, por exemplo: atualizar o jogo enquanto ele estiver
rodando, e parar de atualizar quando ele for finalizado. Em outras, a
preocupação é executar N passos, guardando a informação de qual passo está
sendo executado no momento. Para o primeiro caso, existe o laço `while`. Para o
segundo, existe o laço `for`.

Termos
------

- **Loop**: significa "laço", se referindo ao fato de que o fim de um laço é o
  início dele próprio (dando a ideia de repetição).
- **Iteração**: significa "ciclo". Uma iteração é executar um ciclos de um
  laço. Por exemplo, se o seu programa faz a mesma coisa para todo `i` de 0 a
  10, há uma iteração para `i = 0`, outra para `i = 1`, etc., totalizando 11
  iterações;
- **Iterar**: é fazer uma iteração. Pode-se dizer "iterar sobre X" (em que X é
  uma coleção de dados) para significar "fazer a mesma ação para cada dado em
  X".

Estrutura `for`
---------------

Suponha o clássico exemplo de listar números pares de 0 a 10. Podemos concordar
que o código abaixo faz o que se espera:

```java
System.out.println(0);
System.out.println(2);
System.out.println(4);
System.out.println(6);
System.out.println(8);
System.out.println(10);
```

Porém, se for necessário listar até 100, o estilo de código acima fica
inviável. E ficará ainda mais inviável se considerarmos de o usuário dizer qual
o número máximo: como fazer um programa que liste números pares até um número
qualquer que o usuário quem vai dizer qual é?

### Sintaxe de um `for`

Nesse caso, em uma linguagem imperativa, vale mais a pena utilizar uma
estrutura de repetição como `for`. A estrutura do `for` é dada como:

```java
for (inicio; condição; passo) {
    // sequência de comandos
}
```

E seu funcionamento é:

1. Primeiramente, é executado o que está em `inicio`;
2. Então, repete-se:
   1. Verifica-se se o resultado de `condição`;
   2. Se for `false`, interrompe a repetição e segue o código após o `for`;
   3. Se for `true`, executa a sequência de comandos no escopo do `for`;
   4. Depois de executar a sequência de comandos, executa o que estiver no passo.

### Funcionamento detalhado (passo a passo)

É bastante comum que esse `for` seja feito da forma:

```java
for (var i = 0; i < x; i++) {
    // sequência de comandos
}
```

A ideia, nesse caso, é executar a mesma sequência de comandos `x` vezes (ou
seja, para todo `i` de `0` a `x - 1`). Por exemplo:

```java
for (var i = 0; i < 3; i++) {
    System.out.printf("Mostrando %d\n", i);
}
System.out.println("Fim do programa.");
```

Nesse caso, o que o programa fará é:

1. O valor de `i` começa como 0;
2. `i` é menor que 3? Ou seja: 0 é menor que 3? Sim, então executa o que
   estiver no escopo;
3. Mostra o texto "Mostrando 0" (pulando linha);
4. Executa `i++` (ou seja, `i` agora é `0 + 1`, e portanto `i = 1`);
5. `i` é menor que 3? Ou seja: 1 é menor que 3? Sim;
6. Mostra o texto "Mostrando 1";
7. Executa `i++` (agora `i` é 2);
8. `i` é menor que 3? Ou seja: 2 é menor que 3? Sim;
9. Mostra o texto "Mostrando 2";
10. Executa `i++` (agora `i` é 3);
11. `i` é menor que 3? Ou seja: 3 é menor que 3? Não, e portanto said do `for`;
12. Mostra o texto "Fim do programa.".

Visualizando como uma tabela:

| Instrução                                 | `i` | Resultado                  |
|-------------------------------------------|-----|----------------------------|
| `var i = 0`                               | `0` | -                          |
| `i < 3`                                   | `0` | `true`                     |
| `System.out.printf("Mostrando %d\n", i);` | `0` | Console: `Mostrando 0`     |
| `i++`                                     | `1` | -                          |
| `i < 3`                                   | `1` | `true`                     |
| `System.out.printf("Mostrando %d\n", i);` | `1` | Console: `Mostrando 1`     |
| `i++`                                     | `2` | -                          |
| `i < 3`                                   | `2` | `true`                     |
| `System.out.printf("Mostrando %d\n", i);` | `2` | Console: `Mostrando 2`     |
| `i++`                                     | `3` | -                          |
| `i < 3`                                   | `3` | `false` (sai do `for`)     |
| `System.out.println("Fim do programa.");` | \*  | Console: `Fim do programa` |

\*: Vale lembrar que, após a execução do `for`, como `i` foi declarado no
`for`, então `i` já não existe mais quando o `for` terminar de executar.


### Adaptando para a listagem de pares de 0 a 10

Listar números de 0 a 10 pode ser, então, feito da seguinte forma:

```java
for (var i = 0; i <= 10; i++) {
    if (i % 2 == 0) {
        System.out.println(i);
    }
}
```

Nesse caso, se aproveita o fato de que `%` simboliza o resto de uma divisão, e
inteiros pares são os em que a divisão por 2 tem resto 0.

Ou ainda pulando `i` de 2 em 2:

```java
for (var i = 0; i <= 10; i += 2) {
    System.out.println(i);
}
```

[No tutorial seguinte](/langs/java/06-arrays.md), será visto o quanto `for`
pode ser facilmente combinado para aumentar o potencial de `array`s.

Estrutura `while`
-----------------


### Sintaxe de um `while`

A estrutura `while` é dada da forma:

```java
while (condição) {
    // Sequência de comando
}
```

Bastante semelhante a um `if`, porém o `if` executa apenas uma vez, enquanto o
`while` executa enquanto `condição` for `true`. É possível, por exemplo, fazer
um `while` que executa eternamente entregando `true` como condição:

```java
while (true) {
    System.out.println("Looooop!");
}
```

Geralmente, o objetivo é executar a sequência de comandos até que algo se torne
falso. Por exemplo, o programa abaixo pede números ao usuário até que o número
esteja dentro dos limites que o programa exige:

```java
var console = System.console();

System.out.print("Insira um número de 0 a 10:");
var input = Integer.parseInt(console.readLine());

while (input > 10 || input < 0) {
    System.out.println("Número inválido! Ele deve ser de 0 a 10!");
    System.out.print("Insira um número de 0 a 10:");
    input = Integer.parseInt(console.readLine());
}

System.out.println("Número válido.");
```

Perceba que, diferente do `for`, não se tem a ideia de "N passos", mas sim de
"até que X seja falso".

### Exemplo de `while`: calcular raíz quadrada

Um exemplo envolvendo cálculo numérico é o de cálculo de raiz quadrada de `x`:

```java
var x = 10.0;

var old = 0.0;
var guess = 100.0;  // can be any double != x

while (guess != old) {
    old = guess;
    guess = (guess + x / guess) / 2;
}

System.out.printf("Raiz de %f: %f\n", x, guess);
```

A técnica utilizada é a do
[Método de Newton para Cálculo de Raízes de Função](https://en.wikipedia.org/wiki/Newton%27s_method),
que consiste em ir de pouco em pouco convergindo para a raiz aproveitando a
derivada da função (conceito visto em Cálculo) a cada passo. Não é importante
aqui saber como o método funciona, mas sim prestar atenção em um detalhe: o
objetivo não é executar N passos, mas sim continuar executando até que o valor
de `guess` pare de mudar, e isso varia de `x` para `x` (alguns precisarão de
mais passos, outros de menos).

Interrompendo estruturas de repetição
-------------------------------------

É possível parar a execução de uma estrutura de repetição utilizando o comando
`break`:

```java
while (true) {
    System.out.printf("Write \"end\" to quit: ");
    var input = System.console().readLine();

    if (input.equals("end")) {
        break;
    }
    System.out.println("Not quitting.");
}

System.out.println("The end.");
```

Nesse caso, a partir do momento que o usuário digitar "end", o `break` será
executado e o `while` irá parar de executar (indo para o print de "The end.").

Pulando uma iteração
--------------------

Em outros casos, é possível pular a iteração atual para a próxima utilizando
`continue`. Por exemplo, no caso da listagem de pares:

```java
for (var i = 0; i <= 10; i++) {
    if (i % 2 != 0) {
        continue;
    }
    System.out.println(i);
}
```

Nesse caso, será pulada toda iteração em que `i` não for par.

Recomendações de leitura
------------------------

Nenhuma.

--------------------------------------------------------------------------------

[Ir para o próximo tutorial](/langs/java/06-arrays.md)
