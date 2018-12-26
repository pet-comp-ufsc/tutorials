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

