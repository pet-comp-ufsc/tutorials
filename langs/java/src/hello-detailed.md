"Hello, world!": Explicação detalhada
=====================================

Veremos de dentro para fora como funciona esse programa de exemplo:

- `System.out.println(...)`:
  Esse comando serve para mostrar um texto na tela e em seguida pular uma
  linha. Existe um comando parecido que não pula a linha no final, chamado
  `System.out.print`. Para fins de comparação, o código abaixo:

  ```java
  System.out.print("Hello,");
  System.out.print(" ");
  System.out.print("world");
  System.out.print("!");

  System.out.println("Good");
  System.out.println("bye");
  System.out.println(",");
  System.out.println(" world...");
  ```

  Ao ser executado, mostraria:

  ```
  Hello, world!Good
  bye
  ,
   world...
  ```

  Inclusive, com isso podemos notar uma coisa: o programa é executado **passo a
  passo**, **na ordem que você definiu**. Portanto, se algo saiu errado,
  lembre-se de que em quase todas as vezes em que o programa não executa como
  planejado, o erro foi seu :) (acredite isso é ligeiramente motivacional).

- `public static void main(String... args)`:

  Cada palavra dessas envolve uma série de conceitos os quais não convém
  explicar logo agora, mas ao menos para que entenda para que serve essa linha:
  quando você executa `java AlgumaCoisa`, o que o programa faz é procurar por
  esse nosso colega chamado "main". Ou seja, é a partir dele que nosso programa
  começa a executar.

  Você pode fazer, por exemplo:

  ```java
  public class OtherThanMain {
      public static void foo(String... args) {
          System.out.println("Executando foo...");
      }

      public static void main(String... args) {
          System.out.println("Executando main...");
      }

      public static void bar(String... args) {
          System.out.println("Executando bar...");
      }
  }
  ```

  E, ao executar, o que irá acontecer é:

  ```
  $ java OtherThanMain
  Executando main...
  ```

  Em contrapartida, se tivermos:

  ```java
  public class WithoutMain {
      public static void thisIsNotMain(String... args) {
          System.out.println("Hey, this is not main!");
      }
  }
  ```

  Ao tentar executar, tomaríamos um erro:

  ```java
  $ java WithoutMain
  Error: Main method not found in class Foo, please define the main method as:
      public static void main(String[] args)
  or a JavaFX application class must extend javafx.application.Application
  ```

  Esse erro está simplesmente nos dizendo "não encontrei o `main`, por favor,
  se for executar essa classe, defina o `main` nela", o que demonstra que
  efetivamente o `main` é o que Java procura para executar.

  Perceba que os comandos executados são apenas os que estão entre chaves ("{"
  e "}"). Isso se dá porque as chaves delimitam o início e fim de um escopo, o
  que será visto mais adiante na [aula 4](04-if-and-switch.md), mas por
  enquanto entenda como "o início e fim do `main`".

  Quanto aos args, trata-se dos argumentos ao executar o programa, que podem
  ser acessados como um vetor/array, o que será explicado na [aula
  5](05-arrays.md).

- `public class HelloWorld`:

  Em Java, **tudo** precisa estar dentro de uma classe, incluindo o `main`.
  Nesse caso, nossa classe se chama "HelloWorld" e as chaves ("{" e "}"), assim
  como no `main`, indicam onde começa e termina a implementação dela.

  Uma classe nada mais nada menos do que simboliza um modelo e um tipo de dado,
  o que será melhor explicado na [aula 6](06-classes.md).

- O nome do arquivo: "HelloWorld.java":

  Java possui uma característica bastante única quanto ao nome dos arquivos:
  **obrigatoriamente** o nome do arquivo deve ser o mesmo que o nome da
  principal classe implementada nele. Assim, se tivéssemos:

  ```java
  public class AnotherName {}
  ```

  Nosso arquivo precisaria se chamar "AnotherName.java".

