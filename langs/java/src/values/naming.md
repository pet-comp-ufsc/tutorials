Nomeando adequadamente
======================

É sempre importante lembrar que você irá reler seu código várias vezes (e
outras pessoas, principalmente, mesmo que você jure que não - e uma delas pode
ser você mesmo daqui a 10 meses). Então, trate de dar nomes **suficiente
significativos** para suas variáveis.

Veja o trecho código abaixo:

```java
var a = 75.5;
var b = 1.84;

var c = a + b * b;
```

O que significam `a`, `b` e `c`? Tente o 2º exemplo:

```java
var w = 75.5;
var h = 1.84;

var i = w + h * h;
```

Você pode até decifrar pelo que o código está fazendo e pelas variáveis terem
uma letra mais próxima do que significam, mas:

```java
var weight = 75.5;
var height = 1.84;

var bmi = weight + height * height;
```

É bem mais direto e, apenas lendo o código (dado o conhecimento da sintaxe), é
possível entender do que se trata: é um cálculo de IMC. Perceba que apenas
`weight` e `height` foram suficientes para entender que se tratam de peso e
altura da pessoa, e `bmi` é ao menos a sigla BMI (_Body Mass Index_), que é uma
sigla bem estabelecida (para qualquer brasileiro, por exemplo, se você falar
IMC em vez de "Índice de Massa Corporal", ele irá saber do que se trata).

Vale ressaltar que nomes podem acabar sendo descritivos **em excesso**, e
portanto cuide! Veja:

```java
var personWeightInKilograms = 75.5;
var personHeightInMeters = 1.84;

var bodyMassIndex = personWeightInKilograms + personHeightInMeters * personHeightInMeters;
```

Perceba que o código não ficou mais legível (pelo contrário, agora há muito
ruído visual). Então não descreva muito e nem deixe de descrever: faça **o
suficiente**.

(OBS: Para lidar com diferentes unidades de medida, há formas mais adequadas do
que explicitando no identificador, aproveitando tipos compostos, mas isso é
algo para se ver mais à frente.)

Padrão de nomenclatura de variáveis
-----------------------------------

Em Java, o nome/identificador das variáveis segue o padrão **camelCase**: a
primeira letra do nome é minúscula, todas as palavras são juntas e a primeira
letra de cada palavra é maiúscula (que é exatamente da mesma forma como foi
escrito), por exemplo:

```java
int value;
int anotherValue;
int aValueWithAReallyBigName;
```

**Caso especial: _Siglas_**. No caso de siglas, é preferível que variáveis
sigam padrões no estilo:

```java
String cpf;          // Todo o nome é uma sigla
DvdPlayer dvdPlayer; // O nome começa com uma sigla
int userId;          // O nome termina com uma sigla (ou ela está no meio)
```

Padrão de nomenclatura de variáveis
-----------------------------------

O padrão de nomenclatura para constantes é **SCREAMING\_SNAKE\_CASE**: todas as
letras em maiúsculo, palavras separadas por um _underscore_/_underline_ ("\_").
Por exemplo:

```java
final double PI = 3.1415926535897932384626433;
final int NUM_THREADS = 4;
```
