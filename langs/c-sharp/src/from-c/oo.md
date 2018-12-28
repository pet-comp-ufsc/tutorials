Orientação a Objetos: Novidades em relação a C
==============================================

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
    aqui". Significa que a variável não referencia algum trecho de memória
    alocada. Portanto, para não ter problemas tentando acessar
    atributos/métodos de objetos em cima de `null`, sempre inicialize seus
    objetos! i.e. dê `variable = new Algo(...)`). Se você tem uma variável com
    valor `null` e que todos possam acessar, alguma coisa está errada no seu
    programa, pois significa que alguém está em um estado inválido.

