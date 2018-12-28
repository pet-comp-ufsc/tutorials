Static
======

Em C, como não há métodos, ter uma função solta é extremamente comum. Porém, em
C#, tudo precisa estar dentro de uma classe: então como fazer com que uma
função não dependa seja de um objeto? Para isso serve `static`:

```cs
public class Math {
    public static double square(double x) {
        return x * x;
    }
}
```
