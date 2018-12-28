Não tenho ponteiros. E agora?
=============================

C# até possui ponteiros, mas eles não vão poder ser usados de qualquer maneira
como em C. Mas no fundo, em qualquer linguagem que não seja C, se você está
mexendo com ponteiros, de duas uma:

- Você está precisando manipular memória de uma maneira muito específica (como
  implementar um smart_pointer do C++, ou uma Lista_Encadeada, por exemplo, ou
  ainda utilizar uma arquitetura muito específica na qual endereços específicos
  de memória acessam registradores/IO importantes) e deve estar bastante atento
  aos cuidados com isso;
- Você está fazendo algo de errado e essa com certeza não é a melhor forma de
  fazer o que está querendo.


No caso de C não há algum recurso da linguagem para lidar com referências sem
explicitamente utilizar ponteiros, então não há outra alternativa. Tenha em
mente que ponteiros são potencialmente inseguros e podem levar muito facilmente
a erros, incluindo vazamento de memória ou dupla deleção se você não cuidar da
forma como manuseia eles (e não é meramente uma questão de "basta ser muito bom
na linguagem": ponteiros explícitos são inseguros para *todo mundo*, um
profissional vai apenas ter menos problemas explícitos com eles).

"Referenciar alguma coisa" significa que, em vez de ter uma cópia de outro
valor, você o acessa indiretamente¹. Uma referência **_pode_** ser implementada
com um ponteiro (há diferença entre "ser um" e "ser implementado com um"), mas
tudo depende de como o compilador vai tratá-las.

Para pegar a ideia de referências, segue um exemplo em C (repare nos
comentários):

```c
int main(void) {
    int a = 10;
    int b = a; // `b` é uma cópia de `a`
    int *c = &a; // `c` guarda o endereço de `a`

    // Neste momento:
    //        a = 10; b = 10; *c = 10

    a = 5;  // a =  5; b = 10; *c = 5
    b = 8;  // a =  5; b =  8; *c = 5
    *c = 9; // a =  9; b =  8; *c = 9

    // ...
}
```

No exemplo acima, pode-se dizer que `c` "referencia" `a` (na forma de
ponteiros), então alterações ao valor em `c` alteram também `a`.

No caso de C#, toda variável que guarda um ReferenceType é uma referência,
enquanto que uma que guarde um ValueType é "sempre" uma cópia (com ressalva de
quando há a _keyword_ `ref` antes de sua declaração:

```cs
// Lembre-se de que, em C#, toda `struct` define um ValueType
public struct Point
{
    int x;
    int y;
}


// Ainda em C#, toda `class` define um ReferenceType
public class Vertex
{
    int x;
    int y;
}


public static void Change(Point p) {
    p.x++;
}

public static void Change(Vertex p) {
    p.x++;
}

public static void Change(ref Point p) {
    p.x++;
}

public static void Main() {
    var p = new Point { x = 0, y = 0, };
    var v = new Vertex { x = 0, y = 0, };

    // Nesse caso, como `Point` é um `ValueType`, é enviada uma *cópia* de p
    // para a função `Change`.
    Change(p);

    // Neste momento:
    //     p: { x = 0, y = 0, }
    //     v: { x = 0, y = 0, }

    // Já como `Vertex` é um `ReferenceType`, é enviada uma *referência* a v
    // para a função `Change`. Isso significa que alterações feitas em `p`
    // também alteram `v`.
    Change(v);

    // Neste momento:
    //     p: { x = 0, y = 0, }
    //     v: { x = 1, y = 0, }

    // Se um `ValueType` precisar ser passado por referência (e a função em
    // questão aceitar), é possível enviá-lo com a keyword `ref` antes da
    // variável:
    Change(ref p);

    // Neste momento:
    //     p: { x = 1, y = 0, }
    //     v: { x = 1, y = 0, }
}
```

Também vale ressaltar que, como ValueTypes não são referências, eles não podem
ser `null` (ou seja, não podem "referenciar ninguém") a menos que se diga que a
variável em questão é "Nullable", o que é feito com um `?` após o tipo:

```cs
public static void Main() {
    int i = null;       // Erro: Valuetypes não são "Nullable"
    int? j = null;      // OK: `j` é Nullable
    var k = (int?)null; // O mesmo que `j`, porém com inferência de tipo
}
```

Quando for necessária uma cópia de um ReferenceType, é possível aproveitar o
método `Clone()`, disponível para objetos de algumas classes (especificamente
as que herdem de `Clonable`):

```cs
public static void Main() {
    var v1 = new Vertex { x = 0, y = 0 } ;
    var v2 = x.Clone();

    v2.x = -1;

    Console.WriteLine(v1.x) // => 0
    Console.WriteLine(v2.x) // => -1
}
```

No caso acima, como `v2` é uma cópia de `v1`, alterações em `v2` não alteram
`v1` e vice-versa.

Aproveitando, deve-se tomar cuidado quanto a `ValueTypes`, pois toda vez que
eles são atribuídos a outra variável ou enviados como argumentos para funções,
**sempre** será uma cópia (como dito anteriormente, a menos que dito
explicitamente via `ref`). Ou seja, tomar cuidado com situações como:

```cs
public struct Point {
    int x;
    int y;
}

public class Rect {
    Point p1;
    Point p2;
}

public static void Main() {
    var r = new Rect {
        p1 = new Point { x = 0, y = 0, },
        p2 = new Point { x = 5, y = 5, },
    };

    var p1 = r.p1; // Cuidado! `r.p1` é um ValueType, e portanto será feita uma
                   // cópia de `r.p1`.

    p1.x = 10;

    Console.WriteLine(r.p1.x); // => 0
    Console.WriteLine(p1.x);   // => 10
}
```
