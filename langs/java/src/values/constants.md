Constantes
==========

Como visto no tópico anterior, "variáveis" possuem esse nome pois é possível
alterar qual valor elas guardam. No caso de constantes, isso não pode acontecer
mesmo que o programador tente. Isso é útil para agilizar o compilador quanto a
otimizações, uma vez que ele pode se aproveitar do fato de que aquele valor
garantidamente nunca irá mudar.

Para fazer com que um identificador seja uma constante, basta utilizar `final`
logo antes de sua declaração:

```java
final int x = 10;
int y = x; // o valor de x é copiado para y
x = 4; // Erro de compilação: não se pode alterar o valor de uma constante
```

Quando utilizar constantes? Sempre que o valor não for feito para ser alterado
no contexto em que é utilizado.
