Arrays
======

Índice
------

1. [Motivação](#motivação)
2. [Criação de um array](#criação-de-um-array)
   1. [Quando se tem um tamanho específico](#quando-se-tem-um-tamanho-específico)
   2. [Quando se quer uma lista de elementos pré-definidos](#quando-se-quer-uma-lista-de-elementos-pré-definidos)
3. [Acessando elementos de um array](#acessando-elementos-de-um-array)
4. [Acessando o tamanho de um array](#acessando-o-tamanho-de-um-array)
5. [Combinando arrays e `for`s](#combinando-arrays-e-fors)
6. [Recomendações de Leitura](#recomendações-de-leitura)

Motivação
---------

É comum precisar de listas de valores em programas. Por exemplo, é necessário
lidar com listas de alunos ou professores em uma escola, jogadores e inimigos
em um jogo, e por aí vai. Para isso, existem "Arrays" (ou "Vetores"), que são
uma sequência de valores referenciados por um nome.

Criação de um array
-------------------

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

Acessando elementos de um array
-------------------------------

É possível acessar elementos de um array utilizando `array[indice]`, em que
`indice` vai de 0..N-1 (sendo N o tamanho do array):

```java
var array = new int[] {25, 19, -12};

var first = array[0]; // first = 25
var second = array[1]; // first = 18
var third = array[2]; // first = -12
```

Perceba que não se pode acessar `array[3]` para um array de 3 elementos, já que
o primeiro elemento está no índice 0, e não 1. `array[3]` seria, então, o "4º
elemento", que não existe em um array de 3 elementos.

Vale apontar também que, caso se tente acessar um índice inválido, o programa
irá fechar com o erro `ArrayIndexOutOfBounds`:

```java
var array = new int[] {25, 19, -12};

var nonexistent = array[-1]; // error: ArrayIndexOutOfBounds
var nonexistent = array[3]; // error: ArrayIndexOutOfBounds
var nonexistent = array[20]; // error: ArrayIndexOutOfBounds
```

É possível alterar os elementos de um array da mesma forma que se altera uma
variável:

```java
var array = new int[] {25, 19, -12};

array[0] = 0;

System.out.println(array[0]); // => 0
System.out.println(array[1]); // => 19
System.out.println(array[2]); // => -12
```

Acessando o tamanho de um array
-------------------------------

É possível saber o tamanho/comprimento de um array utilizando a propriedade
`.length`:

```java
var array = new int[] {25, 19, -12};

System.out.printf("array has %d elements\n", array.length); // => array has 3 elements
```

Combinando arrays e `for`s
--------------------------

É possível aproveitar a repetição de passos do `for` para, por exemplo,
percorrer arrays:

```java
var array = new int[] {25, 19, -12};

for (var i = 0; i < array.length; i++) {
    System.out.println(array[i]);
}
```

Perceba como tudo se encaixa: o passo inicial é o primeiro índice do vetor, a
cada passo o índice é incrementado, e é executado o `for` até que `i` chegue a
`array.length - 1`. Com isso, conseguimos executar a mesma ação para todos os
elementos de um vetor. Inclusive, `array[i]` pode ser lido como "o i-ésimo
elemento de `array`".

Estrutura `for-each`
--------------------

Semelhante a um `for` normal, existe uma estrutura específica para iterar por
uma coleção (por exemplo, um vetor). Essa estrutura possui a seguinte sintaxe:

```java
for (T nome: coleção) {
    // Sequência de comandos
}
```

Em que `T` é o tipo de cada item da coleção (`var` é permitido), `nome` é o
nome da variável que guardará cada item da coleção. Para ver melhor como ele
funciona:

```java
var array = new int[] {25, 19, -12};

for (var item: array) {
    System.out.println(item);
}
```

O programa acima, ao ser executado, mostrará:

```text
25
19
-12
```

Ou seja, a cada iteração, `item` guarda um dos itens de `array`. Esse `for` é
util quando o índice do elemento não é importante (no exemplo acima, o que
importa é acessar os elementos em ordem, mas efetivamente qual o índice deles
não é importante). O código é equivalente (perceba: equivalente, mas não
igual!) a:

```java
var array = new int[] {25, 19, -12};

for (var i = 0; i < array.length; i++) {
    var item = array[i];
    System.out.println(item);
}
```

No fundo, o que o `for-each` faz é aproveitar a interface
[Iterable](https://docs.oracle.com/javase/10/docs/api/java/lang/Iterable.html)
dos padrões da linguagem, mas isso será visto noutro tutorial.

Recomendações de leitura
------------------------

1. Uso adequado de matrizes

--------------------------------------------------------------------------------

[Ir para o próximo tutorial](/lang/java/07-functions.md)
