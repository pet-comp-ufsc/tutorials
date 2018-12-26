05 - Funções
============

Índice
------

1. [Motivação](#motivação)
2. [Pequeno exemplo](#pequeno-exemplo)
3. [Sobrecarga](#sobrecarga)
4. [Assinatura de uma função](#assinatura-de-uma-função)

Motivação
---------

Como programador, frequentemente você irá ouvir as palavras "reuso" e
"legibilidade". Uma das maneiras mais comuns de se ter ambas em um único lugar
é através de **funções**. Funções são trechos de código que podem ser
referenciados por um nome, para então executar o trecho de código
correspondente a esse nome.

Em Java, uma função é composta por **tipo de retorno**, **nome**,
**parâmetros** e **implementação**:
- **Tipo de Retorno**: Indica qual é o tipo de dado que é entregue como
  resposta pela função. Pode ser qualquer tipo de dado utilizado na declaração
  de uma variável, salvo o tipo `void`, que é responsável por indicar que a
  função apenas executa o seu código mas não entrega uma resposta.
- **Nome**: Utilizado para referenciar a função posteriormente.
- **Parâmetros**: Indicam quais informações devem ser entregues à função para
  que ela execute. Por exemplo, a função `square`, que eleva um número ao
  quadrado, necessita saber *qual* número será elevado ao quadrado.
- **Implementação**: Define a sequência de código que será executada ao se
  chamar a função. "Chamar" uma função significa pedir para que sua
  implementação seja executada.

Inclusive, funções fazem com que tenhamos apenas um lugar para consertar um
erro quando ele existir. Por exemplo: imagine que você fez um código que pede a
senha para o usuário, mas percebe que esqueceu de não mostrar a senha na tela.
Se o mesmo código estiver espalhado pelo programa, ele terá que ser consertado
em cada um dos lugares. Porém, se em vez disso tivermos uma função
"askPassword", teremos que corrigir apenas um único lugar (que é na
implementação dessa função), e então todo lugar que a chamar já estará
consertado.


Pequeno exemplo
---------------

Um pequeno exemplo de uma função poderia ser o próprio `square` mencionado
anteriormente:

```java
int square(int x) {
    return x * x;
}
```

Descrevendo os elementos dessa função:
- **Tipo de Retorno**: `int`. Ou seja, essa função pode ser utilizada em
  qualquer ponto em que se possa utilizar um `int`, inclusive para enviar como
  parâmetro a outra função.
- **Nome**: `square`.
- **Parâmetros**: `int x`. Ou seja, essa função exige que seja enviado um valor
  do tipo `int` como primeiro parâmetro, e internamente ele será chamado de
  `x`.
- **Implementação**: A implementação apenas significa "retorne a execução para
  quem chamou a função e entregue `x * x` como resposta".

Tendo essas definições, o código dessa função pode ser executado a partir do
seu nome, por exemplo:

```java
System.out.println(square(3)); // => 9
System.out.println(square(-1)); // => 1

var x = 10;
System.out.println(square(x)); // => 100

var y = square(2);
System.out.println(y); // => 4

String err = square(9); // Erro: "int" não pode ser convertido para "String".
```

Funções com retorno "void"
--------------------------

Em alguns momentos, serão criadas funções para não repetir o mesmo código ao
longo do projeto, sem a intenção de dar uma resposta. Nesses casos, utilizamos
o tipo `void` no retorno:

```java
void doSomething() {
    for (var i = 0; i < 3; i++) {
        System.out.println("I'm doing something important...");
    }
}
```

Nessa função, estamos criando uma função (chamada `doSomething`) que não recebe
parâmetros e também não entrega uma resposta, apenas executa comandos.

Inclusive, até o momento vimos uma função com retorno `void`: a função `main`.


Sobrecarga
----------

É possível, em várias linguagens de programação, definir duas ou mais funções
de mesmo nome, porém com os tipos dos parâmetros diferentes. Assim, o
compilador olha quais valores foram passados por parâmetro para uma função para
descobrir qual deve ser chamada. Por exemplo:

```java
void foo() {
    System.out.println("Calling foo()...");
}

void foo(int x) {
    System.out.printf("Calling foo(%d)...\n", x);
}

void foo(String s) {
    System.out.printf("Calling foo(%s)...\n", s);
}

void foo(String s, int x) {
    System.out.printf("Calling foo(%s, %d)...\n", s, x);
}


void main(String[] args) {
    foo();          // => Calling foo()...
    foo(3);         // => Calling foo(3)...
    foo("Hey", 2);  // => Calling foo(Hey, 2)...
    foo("Dude");    // => Calling foo(Dude)...
}
```

Esse mecanismo (de poder ter funções com mesmo nome, porém tipos dos parâmetros
diferentes) se chama "Sobrecarga de função". Perceba que é essencial que as
funções mantenham uma **assinatura** diferente.


Assinatura de uma função
------------------------

Uma função é identificada pela sua **assinatura**. A assinatura de uma função é
composta pelo **nome e tipos dos parâmetros** (observe que **o tipo de retorno
_NÃO_ faz parte da assinatura**). Assim, o compilador é capaz de diferenciar
duas funções apenas analisando a assinatura delas. Por exemplo:

```java
void foo() { ... }
void foo(int x) { ... } // OK, outra função
void foo(int otherParamName) { ... } // Erro: foo(int) já foi definida
int foo() { ... } // Erro: foo() já foi definida
int foo(int x) { ... } // Erro: foo(int) já foi definida
```
