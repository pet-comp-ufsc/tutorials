Propriedades de Arrays
======================

Como acessar propriedades
-------------------------

Toda propriedade de um valor, em Java, pode ser acessada com `.`, no formato:
`valor.propriedade`. Por exemplo, a propriedade [`length`](#length) de um array
qualquer armazenado em uma variável chamada `seuarray` pode ser acessada como
`seuarray.length`.

Vale apontar que valores de tipos primitivos não possuem propriedades.

`length`
---------

É possível saber o tamanho/comprimento de um array utilizando a propriedade
`length`:

```java
var array = new int[] {25, 19, -12};

System.out.printf("array has %d elements\n", array.length); // => array has 3 elements
```
