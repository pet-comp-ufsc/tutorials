C# para programadores C
=======================

Básicos
-------

Se você veio de C e sabe somente C, prepare-se para o mundo novo da Orientação
a Objetos. A maior diferença notável entre instâncias de `struct`s de C e
objetos de C# é o fato de que objetos possuem métodos (i.e.
funções do próprio objeto). No caso específico de Java, C# e Cobra, toda função
é uma função-membro, ou seja, não existe função "solta", todas elas precisam
estar dentro de uma classe. Isso inclui também a função main(), visto que, em
C, um Hello World seria:

```c
#include <stdio.h>

int main(void) {
    printf("Hello, world!\n");
    return 0;
}
```

Enquanto que em C# seria:

```cs
using System;

public class INeedAClassForEverything {
    public static void Main() {
        Console.WriteLine("Hello, world!");
    }
}
```

Um pouco mais comprido, sim, devido principalmente à decisão de projeto da
linguagem de que tudo precisa estar em uma classe. Bem, acostume-se.

Há várias construções que são quase iguais em ambas as linguagens, por exemplo,
o que em C seria:

```c
int sum = 0;
for (int i = 0; i < 10; ++i) {
    sum += 1;
}

printf("Sum: %d\n", sum);

if (sum > 20) {
    printf("Sum is bigger than 20\n");
} else if (sum > 10) {
    printf("Sum is between 10 and 20\n");
} else {
    printf("Sum is less/equal 10\n");
}
```

Em C# ficaria:

```cs
int sum = 0;
for (int i = 0; i < 10; i++) {
    sum += i;
}

Console.WriteLine(string.Format("Sum: {0}", sum));

if (sum > 20) {
    Console.WriteLine("Sum is bigger than 20");
} else if (sum > 10) {
    Console.WriteLine("Sum is between 10 and 20");
} else {
    Console.WriteLine("Sum is less/equal 10");
}
```

Note o {0} em String.Format. 0 é o índice do parâmetro a ser substituído ali.
Exemplo:

```cs
String.Format("{0} {1} {2} {3}", 1, true, 3.14f, Console.In);
```

Irá retornar uma String com:

```
1 true 3.14 SystemIO.Reader+NullStreamReader
```

Note também que foi possível colocar um `Console.In` na formatação de String, o
que resultou em um texto estranho (`SystemIO.Reader+NullStreamReader`).  Isso
se dá porque o string.Format na verdade só chama o método `ToString()` de cada
parâmetro, o que em alguns casos o padrão é mostrar o tipo do objeto. Métodos
serão vistos melhor mais a frente.

Uma pequena tabela mostrando um pouco do que há em C de diferente/igual a C#:

| Recurso          | C   | C#                                                   |
| -----------------|-----|------------------------------------------------------|
| Ponteiros        | Sim | Não¹                                                 |
| Classes/Objetos  | Não | Sim                                                  |
| Structs          | Sim | Structs são ValueTypes², Classes são ReferenceTypes³ |
| Macros           | Sim | Sim⁴                                                 |
| Namespaces       | Não | Sim                                                  |
| Function-pointer | Sim | Possui Delegates e Events                            |

¹: Na verdade sim, mas não funcionam da mesma forma. Explicado mais adiante em
   [Não tenho ponteiros. E agora?](#não-tenho-ponteiros-e-agora).
²: [ValueTypes](https://msdn.microsoft.com/en-us/library/s1ax56ch.aspx)
³: [ReferenceTypes](https://msdn.microsoft.com/en-us/library/490f96s2.aspx)
⁴: C# tem macros, mas não da mesma forma que C: elas apenas definem símbolos
   que podem ser utilizados em `#ifndef`, por exemplo, mas não servem para
   definir constantes.


Orientação a Objetos: Novidades em relação a C
----------------------------------------------

Se você vem de C, é necessário entender um pouco sobre Orientação a Objetos
(OO). Em C não existe Objeto no sentido de OO, então as estruturas são
agregados de informações conforme você definir (para não sair infestando o
programa com variáveis em todo lugar, definindo tipos que possuem propriedades
próprias, como `User` possuir `login` e `email`). Ou seja, são muito mais
organizacionais do que exatamente feitos para interagir entre si (comparando
com objetos).

Em linguagens que possuem orientação a objetos, você tem, advinhe, objetos.
Objetos são diferentes (inclusive conceitualmente) de estruturas do C.

Por simplicidade, um objeto possui **atributos** (as variáveis internas dele),
**constantes** internas, e **métodos** (funções-membro).

Uma das ideias da orientação a objetos é a **troca de mensagens** entre os
objetos, que se dá por meio de **métodos** (lembre-se de que operadores, ou
seja, +, -, \*, /, <<, >>, <, >, <=, >=, etc., também são mensagens - menos em
Java e Object-Pascal, são umas das únicas linguagens orientadas a objeto em que
operadores são procedurais - ou seja, fazem apenas comparações numéricas -;
definir como esses operadores funcionam se chama **_operator overloading_**).

Em C, quando você instancia uma estrutura, os dados internos dela (suas
variáveis) são carregados com lixo de memória, ou seja: foi cedido um espaço de
memória para eles, mas esse espaço não foi zerado, então se a última ação em um
dos bytes que foram cedidos foi escrever um "5" nele, esse 5 estará lá no meio
da sua instância (a menos que você use um `calloc`). Não há uma ideia de "o que
acontece quando sou inicializado?", que é chamado de **construtor**. Em OO você
possui construtores, para os quais você pode passar parâmetros que dirão como o
objeto será inicializado. Ou seja, em C, para você inicializar uma estrutura:

```c
typedef struct {
    int first_value;
    int second_value;
    char third_value;
} my_struct;

int main(void) {
    my_struct instance = {
        .first_value = 5,
        .second_value = -1,
        .third_value = 'a',
    };

    // ...
}
```

Em Orientação a Objetos, quando esses valores precisam já estar designados
antes do objeto estar pronto para uso (por exemplo, já ter uma ID, e que o
programador não pode esquecer de dar o valor a ela), você possui construtores.

_OBS: Construtores não servem apenas para definir o valor dos atributos. Um
construtor de uma janela por exemplo pode também colocar cor de fundo padrão,
conectar botões às funções que serão executadas ao clicar neles, etc._

No caso de C#, my_struct poderia ser implementado da seguinte forma:

```cs
class MyStruct {
    int firstValue;
    int secondValue;
    char thirdValue;

    // Construtores são definidos como funções sem retorno e com nome igual ao
    // da classe
    public MyStruct(int firstValue, int secondValue) {
        this.firstValue = firstValue;
        this.secondValue = secondValue;
        this.thirdValue = 'a'; // Supondo que o padrão de thirdValue seja 'a'
    }
}

public class Example {
    public static void Main() {
        // `instance` é inicializada como uma MyStruct com `firstValue` = 5,
        // `secondValue` = -1 e `thirdValue` = 'a'.
        var instance = new MyStruct(5, -1);
    }
}
```

Perceba que, em C#, objetos são criados utilizando o operador `new`. Para
ReferenceTypes, isso significa fazer uma alocação dinâmica (ou seja, é análogo
a chamar uma função que dá `calloc` e inicializa os valores da `struct`
conforme conveniente). Em outras palavras, o construtor de `MyStruct` seria
equivalente a, em C, ter uma função de inicialização para `struct my_struct`:

```c
my_struct* new_my_struct(int first_value, int second_value) {
    my_struct* obj = calloc(1, sizeof(my_struct));

    *obj = (my_struct){
        .first_value = first_value,
        .second_value = second_value,
        .third_value = 'a',
    }

    return obj;
}
```

C# ainda tem um "jeito C# de fazer as coisas", que nada mais é do que, em vez
de utilizar um construtor para setar os valores iniciais da classe, utilizar o
que se chama de Initializer List (também presente em C++).

Funciona semelhante à inicialização de `struct`s de C:

```cs
class MyStruct {
    int firstValue;
    int secondValue;
    char thirdValue = 'a'; // É possível já dar o valor padrão de um atributo
                           // na sua inicialização
}

public class Example {
    public static void Main() {
        MyStruct instance = new MyStruct {
            firstValue = 5,   // Como em C, é "," e não ";"
            secondValue = -1,
        };
    }
}
```

No caso, suponha que você só dê o valor de `firstValue`, mas não do
`secondValue`. Qual será o valor de secondValue? Em C ele seria inicializado
com lixo da memória, já em C# ele é inicializado com o valor padrão 0. Esse
"valor padrão" varia conforme o tipo de dado, conforme na tabela:

| Tipo de dado                   | Valor padrão |
|--------------------------------|--------------|
| Inteiros (`int`, `short`, ...) | 0            |
| Reais (`float`, `double`, ...) | 0.0          |
| `bool`                         | `false`      |
| `char`                         | `'\0'`       |
| Objetos                        | `null`¹      |

¹: `null` funciona igual ao `NULL` e quer dizer "não há um valor sendo guardado
aqui". Significa que a variável não referencia algum trecho de memória alocada.
Portanto, para não ter problemas tentando acessar atributos/métodos de objetos
em cima de `null`, sempre inicialize seus objetos! i.e. dê `variable = new
Algo(...)`). Se você tem uma variável com valor `null` e que todos possam
acessar, alguma coisa está errada no seu programa, pois significa que alguém
está em um estado inválido.

### Classe e Objeto

Classe != Objeto. Classe é apenas a definição dela, é o "template" que define
características de um tipo. Objeto é a instância de uma classe. Ou seja:

```cs
// Isso é uma classe
class MyClass {}

// Isso é um objeto do tipo MyClass
new MyClass();
```

### Métodos

Métodos (_a.k.a._ "funções-membro") são funções de um objeto. Em OO, objetos
podem definir, além de atributos, funções que operam sobre eles. Por exemplo,
um objeto do tipo `User` pode precisar definir qual é o processo de renomear
tal usuário, por exemplo:

```cs
public class User {
    string name;

    public void Rename(string name) {
        // Primeiro, checa-se se o nome é um nome válido
        if (string.IsNullOrEmpty(name)) {
            throw new InvalidArgument("Username cannot be empty or null.");
        }

        this.name = name;
    }
}

static void Foo() {
    var user = new User {
        name = "Josh",
    };

    user.Rename("Carl");

    Console.WriteLine(user.name); // => Carl

    user.Rename(""); // Erro
}
```

### Static

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

### Herança

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

### Modificadores de acesso

Para finalizar a parte de orientação a objetos, apenas mostrar para que servem
`public`, `private`, `protected`, que são os **modificadores de acesso**,
utilizados na declaração de métodos, atributos e propriedades de objetos:

| Modificador   | Ação                                                        |
|---------------|-------------------------------------------------------------|
| `public`      | Visível para qualquer outra classe externa.                 |
| `private`     | Visível apenas para a própria classe. Classes herdeiras não |
|               | poderão ver o que estiver em private da sua superclasse.    |
| `protected`   | Visível para a própria classe e classes-filhas.             |


