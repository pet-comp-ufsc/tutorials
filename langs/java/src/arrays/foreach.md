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
