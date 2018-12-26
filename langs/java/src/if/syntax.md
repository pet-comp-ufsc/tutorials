Sintaxe de um If
================

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

