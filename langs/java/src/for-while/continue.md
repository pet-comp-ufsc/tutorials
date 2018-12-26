Pulando uma iteração
--------------------

Em outros casos, é possível pular a iteração atual para a próxima utilizando
`continue`. Por exemplo, no caso da listagem de pares:

```java
for (var i = 0; i <= 10; i++) {
    if (i % 2 != 0) {
        continue;
    }
    System.out.println(i);
}
```

Nesse caso, será pulada toda iteração em que `i` não for par.
