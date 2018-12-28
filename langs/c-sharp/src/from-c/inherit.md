Herança
=======

Em OO, você irá constantemente ouvir a respeito de **herança**, isso
simplesmente é como se denomina quando uma classe A herda todos os métodos e
atributos de outra, ou seja: se uma classe `B` herda `A`, isso significa que
tudo que `A` tem, `B` também tem, mas o contrário não necessariamente é
verdade.

Herança em C# pode ser feita com `: <classe herdada>` entre o nome da classe e
o `{`:

```cs
public class A {
  int x;
}

public class B : A {
  int y;
}

public class Example {
  public static void Main() {
    var a = new A();
    var b = new B();
    bx = 5;   // => OK
    b.y = 10; // => OK
    ax = 5;   // => OK
    a.y = 10; // => Erro: A não possui o atributo `y`
  }
}
```

Inclusive, quando se diz que `B` herda `A`, também se está dizendo que todo `B`
é **também** um `A`, e portanto toda função que aceita um `A` aceita também um
`B`:

```cs
static void Foo(A a) {
    // ...
}

static void Bar(B b) {
    // ...
}

static void Test() {
    var a = new A();
    var b = new B();

    Foo(a); // OK
    Foo(b); // OK

    Bar(a); // Erro: `A` não pode ser enviado a algo que pede `B`
    Bar(b); // OK
}
```
