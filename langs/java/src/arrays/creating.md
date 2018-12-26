Criando um array
================

Há algumas formas de se criar um array.

### Quando se tem um tamanho específico

```java
// Em Java 9 ou anterior:
T[] array = new T[10];
// Em Java 10+:
var array = new T[10];
```

Em que `T` é o tipo de dado dos elementos do array. Por exemplo, se for um
array de `int`:

```java
// Em Java 9 ou anterior:
int[] array = new int[10];
// Em Java 10+:
var array = new int[10];
```

Com isso, `array` será um array de 10 inteiros, todos eles com o valor "0"
(valor padrão para inteiros, floats, doubles, etc.).
Ou se for `String`:

```java
// Em Java 9 ou anterior:
String[] array = new String[10];
// Em Java 10+:
var array = new String[10];
```

Porém, vale lembrar que, como `String` não é um tipo primitivo, então os
elementos do `array` não serão Strings vazia, mas sim `null` (a grosso modo,
significa ausência de informação, o que é diferente de um texto com 0
caracteres). Então tome cuidado quando criar vetores de tipos não-primitivos,
principalmente quando tentar acessar propriedades deles:

```java
var array = new String[3];

var isAda = array[0].equals("Ada"); // error: NullPointerException

array[0] = "Bob";

var isAda = array[0].equals("Ada"); // idAda = false
var isBob = array[0].equals("Bob"); // idAda = true
```

### Quando se quer uma lista de elementos pré-definidos

É possível criar arrays já colocando os elementos que estarão nele:

```java
T[] array = {value1, value2, value3, ...,};
// Ou...
var array = new T[] {value1, value2, value3, ...,};
```

Por exemplo:

```java
// Em Java 9 ou anterior:
int[] array = {1, 2, 3, 4, 5};
// Em Java 10+:
var array = new int[] {1, 2, 3, 4, 5};
```

Nesse caso, `array`terá 5 elementos, sendo eles, na ordem: 1, 2, 3, 4 e 5.

