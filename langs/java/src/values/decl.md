Declaração e instanciação
=========================

Três conceitos que serão vistos frequentemente em programação imperativa:

Declaração
----------

Trata-se de "dizer que uma variável existe". Em código:

```java
int x;
String name;
double thing;
```

Perceba que essas variáveis não foram inicializadas: o que foi feito é uma
**declaração** sem que houvesse uma inicialização, ou seja: dissemos que elas
existem, mas não demos um valor.

Porém:

```java
int x = 0;
```

Estamos declarando `x` **e** inicializando.

Instanciação
------------

Instanciar é criar um valor novo, a grosso modo. Por exemplo:

```java
int x = 0;  // Instanciamos o valor 0, que é um número inteiro
int y = 10; // Instanciamos o valor 10, que é um número inteiro
int z = x;  // Instanciamos um valor novo que é uma *cópia* do valor de `x`

String name = "Alice"; // Instanciamos uma String com o texto "Alice"
String fullname = "Alice" + " " + "Cooper";
```

Na última linha, instanciamos 5 `String`'s, respectivamente:

- Uma contendo o texto "Alice";
- Outra contendo o texto " " (apenas um espaço em branco);
- Outra contendo o texto "Cooper";
- Outra sendo a concatenação de "Alice" e " ", que gera uma instância contendo
  "Alice ";
- Por fim, outra sendo a concatenação de "Alice " e "Cooper', que gera uma
  instância contendo o texto "Alice Cooper".

Porém, foi declarada apenas uma variável: `fullname`. Uma situação semelhante
pode ser vista em:

```java
int x = 0;
x = 3;
```

Ainda temos apenas uma única variável declarada (`x`), porém inicialmente
instanciamos o valor 0 e, em seguida, o valor 3.

