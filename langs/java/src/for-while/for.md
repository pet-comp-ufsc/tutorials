Estrutura `for`
===============

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

[No tutorial seguinte](../arrays.md), será visto o quanto `for`
pode ser facilmente combinado para aumentar o potencial de `array`s.

