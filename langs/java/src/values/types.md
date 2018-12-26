Tipos de dados
==============

Os tipos de dados guardados por variáveis e constantes são separados entre
"primitivos" e "compostos".

### Primitivos

Os tipos primitivos são os que guardam a menor unidade possível de dado. São
eles:

| Tipo      | Significado     | Tamanho | Valores possíveis    |
|-----------|-----------------|---------|----------------------|
| `byte`    | Número inteiro  | 1 byte  | -128 a 127           |
| `short`   | Número inteiro  | 2 bytes | -65536 a 65535       |
| `int`     | Número inteiro  | 4 bytes | -2³² a 2³² - 1 |
| `long`    | Número inteiro  | 8 bytes | -2⁶⁴ a 2⁶⁴ - 1 |
|-----------|-----------------|---------|----------------------|
| `float`   | Número real     | 4 bytes | [1]                  |
| `double`  | Número real     | 8 bytes | [1]                  |
|-----------|-----------------|---------|----------------------|
| `boolean` | Valor lógico    | 1 byte  | Falso e Verdadeiro   |
|-----------|-----------------|---------|----------------------|
| `char`    | Um caractere    | 2 bytes | [2]                  |

[1]: Definir os valores possíveis para números reais não é uma tarefa tão
simples à primeira vista. Números reais utilizam um padrão de armazenamento
chamado
[Ponto Flutuante](https://en.wikipedia.org/wiki/Floating-point_arithmetic) (por
isso o nome `float`), em que temos uma mantissa, uma base e um expoente, e o
valor de um número nesse padrão é dado por `mantissa * base ^ expoente`.  Por
conta disso (aliado ao fato de que, em computadores, a base e o número de bits
da mantissa e do expoente são fixos), _floats_ conseguem maior precisão em
valores entre -1 e 1, porém a medida em que os valores ficam mais distantes de
0, os números representados com esse padrão começam a ficar mais esparços
(mantendo-se o mesmo tamanho para a mantissa).

Quanto ao nome `double`, a ideia vem de "Double Precision", pelo fato de que
ocupa o dobro de espaço em memória (e portanto diz-se ter o dobro de precisão).
Quanto a quais variáveis utilizar, recomenda-se double (salvo raras exceções,
como ambientes em que o consumo de memória por floats seja o gargalo -- por
exemplo, ambientes com objetos 3D compostos de absurdamente muitos vértices
--).

_(OBS: **NÃO** utilize `float` nem `double` para armazenar dados sensíveis
(como, por exemplo, dinheiro). Veja na [recomendação de leitura
 #4](./recommendations.md) o porquê disso.)_

[2]: Textos, dentro do mundo da computação, possuem codificações específicas
para indicar o que é cada caractere. Essencialmente, um caractere não passa de
um número inteiro. Por exemplo:

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

Pois, pelo padrão de codificação [Unicode](https://unicode-table.com/en/), que
é o que Java também utiliza (especificamente, Java utiliza o formato
[UTF-16](https://en.wikipedia.org/wiki/UTF-16), que engloba caracteres
não-ocidentais, e, como o nome diz: ocupa 16 bits por caractere), 97 é o valor
que simboliza a letra "a" (minúsculo), enquanto 98 simboliza "b", 65 a letra
"A" (maiúsculo) e 33 simboliza "!". Porém, texto em computação não
necessariamente é apenas letras (a-z, A-Z), acentos e pontuações ("!", "`",
"~", ...), mas também elementos especiais como quebra de linha. Por exemplo:

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

Pois "13" é o código que simboliza quebra de linha (em SO's baseados em Unix;
em Windows, uma quebra de linha é o caractere 13 seguido do caractere 10).


### Compostos

Os tipos compostos são, em resumo, todos os que não são primitivos. Por exemplo:

- `String`;
- `Object`;
- `ArrayList`;
- Arrays (demarcados com um `[]`, visto na [próxima aula](04-arrays.md)).

[Em uma aula mais a frente](06-classes.md), aprenderemos a criar nossos
próprios tipos compostos.

