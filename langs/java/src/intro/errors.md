Erros de Compilação e Execução
==============================

Índice
------

1. [Compreendendo erros de compilação](#compreendendo-erros-de-compilação)
2. [Compreendendo erros de execução](#compreendendo-erros-de-execução)

Compreendendo erros de compilação
---------------------------------

### Erros lançados pelo `javac`

Os erros que o `javac` mostra costumam estar no seguinte formato:

```text
[arquivo]:[linha]: error: [mensagem]

[código]

[nº total de erros encontrados]
```

Em alguns casos, no lugar de `error` estará escrito `warning`. Warning não são
erros efetivamente (mas devem ser tratados como se fossem!), mas sim coisas que
o compilador percebem que podem gerar problemas futuramente. Por exemplo, se
você está utilizando um comando que está marcado como "Deprecated" (ou seja,
não é aconselhável utilizá-lo pois ou é inseguro ou será removido futuramente),
o seu programa não contém erros de código em si, mas o compilador irá avisá-lo
de que está utilizando o tal comando não-aconselhável.

**Erros de Sintaxe** (SintaxError): Ocorrem quando o código escrito não confere
com a gramática da linguagem, por exemplo:

```java
public class {
}
```

O código acima, ao se tentar compilá-lo, o compilador acusará um erro de
sintaxe:

```text
Example.java:1: error: <identifier> expected
public class {
            ^
1 error
```

O erro se dá porque o formato esperado para uma declaração de classe é:

```java
[modificador de acesso] class <Nome da classe> {
    [declarações]
}
```

Ou seja, `public class Example {}` é válido, porém `public class {}` (sem o
**identificador** para o nome da classe) não.


Compreendendo erros de execução
-------------------------------

Erros de execução costumam ser assustadores, afinal você, um aprendiz muito
contente com seus novos conhecimentos, inocentemente executa o programa:

```java
public class Example {
    public static void main(String[] args) {
        var name = "Nice Guy";
        System.out.println("Hello, Mr. " + name.charAt(9) + "!");
    }
}
```

E é bombardeado com uma mensagem de erro enorme:

```text
Exception in thread "main" java.lang.StringIndexOutOfBoundsException: String index out of range: 9
        at java.base/java.lang.StringLatin1.charAt(StringLatin1.java:44)
        at java.base/java.lang.String.charAt(String.java:692)
        at Example.main(Example.java:4)
```

Apesar de poder assustar um pouco, é simples entender o que essas mensagens
estão dizendo:
- _"Exception in thread "main""_: Apenas quer dizer que um erro aconteceu
  durante a execução do programa. "Exception" se dá pelo mecanismo de
  tratamento de erros de Java (que se chamam "Exceptions"). "main" é a linha de
  execução (_thread_) do programa em que ocorreu o erro, mas o conceito de
  _threads_ só se vê em programação concorrente. Para os seus programas, a
  única _thread_ é a "main".
- `java.lang.StringIndexOutOfBoundsException": É o nome do erro. `java.lang`
  indica que é um erro reconhecido pela biblioteca padrão de Java, e o resto é
  possível tentar deduzir: tentou-se acessar uma string (texto) em um índice
  inválido (por exemplo, o 5º caractere do texto ".
- "String index ouf of range: 9": Significa que se tentou acessar o 10º
  caractere (índices começam em 0, portanto 9 é o 10º índice) do texto.

O resto é a ordem de qual comando executou qual subcomando até acontecer o
erro:
1. Primeiro se executou `main`;
2. `main` na linha 4 executou o comando `String.charAt`;
3. `String.charAt, na linha 692 chamou o comando `StringLatin1.charAt`;
4. `StringLatin1.charAt` percebeu que o índice era inválido e, na linha 44, o
   erro foi acusado (o que, para o caso de Exceptions, se chama "lançar uma
   Exception").

