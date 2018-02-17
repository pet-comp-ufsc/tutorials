03 - Variáveis e Constantes
===========================

Motivação
---------

Em nossos programas, não iremos querer apenas mostrar textos. Em praticamente
100% dos casos iremos trabalhar com dados, como por exemplo: dados de usuários
(nome, e-mail, ...), medições (temperatura, distâncias, ...), ou mesmo
elementos mais abstratos, como posição do mouse na tela, coordenadas dos
vértices de um objeto 3D, cores dos pixeis de uma imagem, e por aí vai.

Para isso, precisamos de uma maneira de referenciar esses dados para poder
trabalhar com eles, além de poder saber qual tipo de dado estamos trabalhando e
realizar operações em cima deles. Nesse quesito, temos o que chamamos de
variáveis e constantes. Uma variável/constante é uma forma de sabermos **o
estado atual** de um dado. Veremos a seguir como trabalhar com eles.

Pequeno exemplo
---------------

O exemplo abaixo ilustra um pequeno programa que cria variáveis e mostra o
valor de cada uma delas:

```java
public class VariablesExample {
    public static void main(String... args) {
        int x = 0;
        int y = 3;

        double z = 10.0;

        System.out.println(x);
        System.out.println(y);
        System.out.println(z);
    }
}
```

Nesse exemplo, foram criadas três variáveis: duas representando números
inteiros (simbolizado pelo `int` antes do nome delas) e outra representando um
número real (simbolizado pelo `double`). Perceba que essas variáveis recebem
nomes: `x`, `y` e `z`. Esse nome é chamado de **identificador**, e serve para
referenciar ou guardar um dado (veremos mais adiante quanto ao conceito de
referência). Executando o exemplo:

```
$ javac VariablesExample.java
$ java VariablesExample
0
3
10
```

Para criar uma variável, deve-se seguir o padrão:

```java
tipo identificador = valor;
```

**Tipo**: O tipo de dado a ser guardado ou referenciado pela variável. Veja em
[Tipos de dados](#tipos-de-dados) para ver o que se pode utilizar.

**Identificador**: O nome que utilizaremos para a variável. Em java, esse nome
segue o padrão **camelCase**, que é exatamente da mesma forma como foi escrito:
primeira letra do nome é minúscula, todas as palavras são juntas e a primeira
letra de cada palavra é maiúscula. Exemplos:

```java
int value;
int anotherValue;
int aValueWithAReallyBigName;
```

Podemos nos referir a uma variável através de seu identificador, como visto no
pequeno exemplo. Podemos, inclusive, utilizar uma variável para dar valor a
outra:

```java
int x = 10;
int y = x;
```

Nesse caso, tanto x quanto y guardam o valor 10. Se fizermos, porém:

```java
int x = 10;
int y = x;
x = 4;
```

A variável `x` terá mudado de valor para 4, porém `y` manterá o valor 10.
Inclusive, o fato de podermos mudar o valor de `x` é o que caracteriza a ideia
de variáveis: o valor delas **pode variar** durante o programa (se algum
programador disser que o valor dela será alterado, como no caso de `x`).

Constantes
----------

Como visto no parágrafo acima, "variáveis" possuem esse nome pois é possível
alterar qual valor elas guardam. No caso de constantes, isso não pode acontecer
mesmo que o programador tente. Isso é útil para agilizar o compilador quanto a
otimizações, uma vez que ele pode se aproveitar do fato de que aquele valor
garantidamente nunca irá mudar.

Para fazer com que um identificador seja uma constante, basta utilizar `final`
logo antes do seu nome:

```java
final int x = 10;
int y = x; // o valor de x é copiado para y
x = 4; // Erro de compilação: não se pode alterar o valor de uma constante
```

Quando utilizar constantes? Sempre que o valor não for feito para ser alterado
no contexto em que é utilizado.

Tipos de dados
--------------

Os tipos de dados guardados por variáveis e constantes são separados entre
"primitivos" e "compostos".

### Primitivos

Os tipos primitivos são os que guardam a menor unidade possível de dado. São eles:

| Tipo    | Significado     | Tamanho | Valores possíveis    |
+---------+-----------------+---------+----------------------+
| byte    | Número inteiro  | 1 byte  | -128 a 127           |
| short   | Número inteiro  | 2 bytes | -65536 a 65535       |
| int     | Número inteiro  | 4 bytes | -2^(32) a 2^(32) - 1 |
| long    | Número inteiro  | 8 bytes | -2^(64) a 2^(64) - 1 |
+---------+-----------------+---------+----------------------+
| float   | Número real     | 4 bytes | [1]                  |
| double  | Número real     | 8 bytes | [1]                  |
+---------+-----------------+---------+----------------------+
| boolean | Valor lógico    | 1 byte  | Falso e Verdadeiro   |
+---------+-----------------+---------+----------------------+
| char    | Um caractere    | 2 bytes | [2]                  |

[1]: Definir os valores possíveis para números reais não é uma tarefa tão
     simples à primeira vista. Números reais utilizam um padrão de
     armazenamento chamado [Ponto
     Flutuante](https://en.wikipedia.org/wiki/Floating-point_arithmetic) (por
     isso o nome `float`), em que temos uma mantissa, uma base e um expoente, e
     o valor de um número nesse padrão é dado por `mantissa * base ^ expoente`.
     Por conta disso (aliado ao fato de que, em computadores, a base e o número
     de bits da mantissa e do expoente são fixos), _floats_ conseguem maior
     precisão em valores entre -1 e 1, porém a medida em que os valores ficam
     mais distantes de 0, os números representados com esse padrão começam a
     ficar mais esparços (mantendo-se o mesmo tamanho para a mantissa).

     Quanto ao nome `double`, a ideia vem de "Double Precision", pelo fato de
     que ocupa o dobro de espaço em memória (e portanto diz-se ter o dobro de
     precisão). Quanto a quais variáveis utilizar, recomenda-se double (salvo
     raras exceções, como ambientes em que o consumo de memória por floats seja
     o gargalo -- por exemplo, ambientes com objetos 3D compostos de
     absurdamente muitos vértices --).

     __(OBS: **NÃO** utilize `float` nem `double` para armazenar dados como
     quantidade monetária. Veja na [recomendação de leitura
     #1](#recomendações-de-leitura) o porquê disso.)__

[2]: Textos, dentro do mundo da computação, possuem codificações específicas
     para indicar o que é cada caractere. Essencialmente, um caractere não
     passa de um número inteiro. Por exemplo:

     ```java
     char a = 97;
     char b = 98;
     char c = 65;
     char d = 33;

     System.out.println(a);
     System.out.println(b);
     System.out.println(c);
     System.out.println(d);
     ```

     O código acima mostrará:

     ```
     a
     b
     A
     !
     ```

     Pois, pelo padrão de codificação [Unicode](https://unicode-table.com/en/),
     que é o que Java também utiliza (especificamente, Java utiliza o formato
     [UTF-16](https://en.wikipedia.org/wiki/UTF-16), que engloba caracteres
     não-ocidentais, e, como o nome diz: ocupa 16 bits por caractere), 97 é o
     valor que simboliza a letra "a" (minúsculo), enquanto 98 simboliza "b", 65
     a letra "A" (maiúsculo) e 33 simboliza "!". Porém, texto em computação não
     necessariamente é apenas letras (a-z, A-Z), acentos e pontuações ("!",
     "`", "~", ...), mas também quebra de linha. Por exemplo:

     ```java
     char lineBreak = 13;

     System.out.print("Hello, ");
     System.out.print(lineBreak);
     System.out.print("World!");
     ```

     Perceba que executando o código acima, mesmo não tendo um `println` (e sim
     apenas `print`, que não pula linha), aparecerá:

     ```
     Hello,
     World!
     ```

     Pois "13" é o código que simboliza quebra de linha (em SO's baseados em
     Unix; em Windows, uma quebra de linha é o caractere 13 seguido do
     caractere 10).


### Compostos

Os tipos compostos são, em resumo, todos os que não são primitivos. Por exemplo:

- `String`;
- `Object`;
- `ArrayList`;
- Arrays (demarcados com um `[]`, visto na [próxima aula](04-arrays.md)).
