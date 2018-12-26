If-else
=======

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

