Acessando elementos de um array
===============================

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

