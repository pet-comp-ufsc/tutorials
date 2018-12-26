04 - Estrutura condicional `If`
===============================

Índice
------

1. [Motivação](#motivação)
2. [Sintaxe de um If](#sintaxe-de-um-if)
3. [If-Else](#if-else)
4. [Brincando com o código](#brincando-com-o-código)

Motivação
---------

Os programas precisam tomar decisões uma hora ou outra. Por exemplo, não é
sempre que determinados comandos serão executados, como: se o usuário escolhe
pagar no cartão, o código que faz o pagamento em dinheiro não será executado.
Para esse comportamento (executar um trecho de código apenas se uma condição
for verdadeira), em Java há a estrutura `if`.



Sintaxe de um If
----------------

Um `if` é definido como:

```java
if (condicao) {
    // sequência de comandos
}
```

Em `condicao`, pode ser colocado qualquer valor do tipo `boolean`. Por exemplo:

```java
if (true) {
    System.out.println("Entrou no if");
}

System.out.println("Após o if");
```

Se a sequência acima for executada, o resultado será:

```text
Entrou no if
Após o if
```

Mudando um pouco o código:

```java
if (false) {
    System.out.println("Entrou no if");
}

System.out.println("Após o if");
```

O resultado agora será:

```text
Após o if
```

Perceba que como a condição era falsa, o trecho dentro do `if` não executou.

Pode-se estender isso para comparações com variáveis:

```java
var x = 10;
var y = 20;

if (x < y) {
    System.out.println("x é menor que y");
}
```

If-else
-------

É possível definir o que o programa fará quando a condição do `if` **não** for
verdadeira utilizando `if-else`, por exemplo:

```java
if (true) {
    System.out.println("Entrou no if");
} else {
    System.out.println("Entrou no else");
}

System.out.println("Após o if");
```

Executando o trecho acima:

```text
Entrou no if
Após o if
```

Alterando o trecho para:

```java
if (false) {
    System.out.println("Entrou no if");
} else {
    System.out.println("Entrou no else");
}

System.out.println("Após o if");
```

E executando:

```text
Entrou no else
Após o if
```

Perceba que, como a condição do `if` era falsa, foi executado o comando
presente no `else`.


Brincando com o código
----------------------

Salve o código abaixo como "PlayWithIf.java" e altere-o da forma que quiser,
compilando e vendo como o programa se comporta:

```java
public class PlayWithIf {
    public static void main(String[] args) {
        var x = 0;
        var y = 10;

        if (x < y) {
            System.out.println(x + " é menor do que " + y);
        } else if (x > y) {
            System.out.println(x + " é maior do que " + y);
        } else {
            System.out.println(x + " e " + y + " são iguais");
        }

        var student1 = "Arthur";
        var student2 = "arthur";

        if (student1.equals(student2)) {
            System.out.println("Both students have the same name");
        } else {
            System.out.println("Something is different with these students.");
            if (student1.equalsIgnoreCase(student2)) {
                System.out.println("Oh yeah, they have different cases.");
            } else {
                System.out.println("And it's mostly everything.");
            }
        }
    }
}
```
