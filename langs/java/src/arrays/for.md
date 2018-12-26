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

