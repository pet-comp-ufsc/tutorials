Properties
==========

Em linguagens OO, costumam ser padrões as seguintes regras:

- Todo atributo deve ser inacessível às outras classes;
- Se um atributo pode ser lido externamente, essa leitura deve se dar a partir
  de um getter;
- Se um atributo pode ser escrito por elementos externos, essa escrita deve se
  dar a partir de um **setter**.

Em algumas delas, a forma como isso é feito é extremamente manual, como Java
por exemplo:

```java
public class A {
    private int something;
    private SomeType another;


    public int getSomething() {
        return something;
    }

    public void setSomething(int value) {
        something = value;
    }

    public SomeType getAnother() {
        return another;
    }

    public void setAnother(SomeType value) {
        another = value;
    }
}
```

Em C#, felizmente há uma maneira simples de lidar com _getters_ e _setters_,
que é através de **Properties**. Para quem conhece Ruby, é semelhante a
`attr_accessor`, `attr_reader` e `attr_writer`: eles geram métodos que fazem a
devida função de _getter_ e _setter_ para você. Para quem conhece Python, é
como utilizar `@property`:

```cs
public class A {
    public int Something {
        get; set;
    }

    public SomeType Another {
        get; set;
    }
}
```

Em alguns casos, é necessário definir como esses métodos são implementados. Por
exemplo, há momentos em que não é possível expor algum atributo como Property
diretamente, então é necessário separá-lo como um atributo e utilizar a
Property para o expor:

```cs
public class A {
    private Type _somethingThatCantBeAProperty;
    public Type SomethingThatCantBeAProperty {
        // get e set são efetivamente métodos, então...podemos simplesmente
        // utilizar os métodos para retornar os valores que queremos.
        get
        {
            return _somethingThatCantBeAProperty;
        }
        set
        {
            // Em um setter, o valor passado após o "=" é dado como `value`.
            _somethingThatCantBeAProperty = value;
        }
    }
}

public class Application {
    public static void Main(string[] args) {
        var a = new A();

        // chama o set
        a.SomethingThatCantBeAProperty = new Type();

        // chama o get
        Console.WriteLine(a.SomethingThatCantBeAProperty);
    }
}
```

**Quando utilizar properties**: sempre que você tiver um atributo público (com
_getter_ e _setter_), faça-o como uma property (ou encapsule-o com, caso não
seja possível ele em si ser uma property). Não utilize properties caso o
_setter_ ou o _getter_ envolva algum cálculo! Nesse caso, use um método
explícito, a fim de manter a intuitividade de que o acesso aquele valor não é
necessariamente trivial/barato.

