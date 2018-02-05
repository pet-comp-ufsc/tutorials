Java e linguagens de programação
================================

Introdução à Programação
------------------------

Para desenvolver programas utilizamos linguagens de programação, classificadas
por diferentes
[paradigmas](https://en.wikipedia.org/wiki/Programming_paradigm). Para termos
uma noção de como funcionam boa parte dessas linguagens, veja os seguintes
exemplos:

> ### Exemplo 1:
>
> ```haskell
> square :: Integer -> Integer
> square x = x * x
> ```

> ### Exemplo 2:
>
> ```python
> n = input('Digite um número positivo:')
>
> while n < 0:
>     print(f'{n} não é positivo!')
>     n = input('Digite um número positivo:')
>
> print(f'Você escolheu o número {n}')
> ```

No [Exemplo 1](#exemplo-1), temos a definição de uma função (semelhante a
matemática) chamada "`square`".

- Na primeira linha, estamos instruindo que `square` recebe um número inteiro e
  entrega como resposta outro número inteiro;
- Na segunda linha, indicamos que esse inteiro se chama `x`, e a resposta de
  square é x multiplicado por ele mesmo (elevando ao quadrado).

A linguagem utilizada nesse exemplo é [Haskell](haskell.org/).


Já no [Exemplo 2](#exemplo-2), temos um pequeno programa que:

- Pede ao usuário para digitar um número inteiro. Esse pedido é feito pelo
  `input('mensagem')`.
- Em seguida, enquanto o número for menor que 0 (ou seja, negativo), informamos
  o usuário do erro e pedimos para ele digitar outro número.
- Se o número deixar de ser negativo, então o programa passa para a próxima
  etapa, que é mostrar o número escolhido pelo usuário.

A linguagem utilizada nesse exemplo é [Python](python.org).

Essas duas linguagens possuem formas completamente diferentes de se descrever
problemas nelas, visto que a primeira é do que chamamos de paradigma funcional
(ver a recomendação [1](#recomendações-de-leitura)) e a segunda do paradigma
imperativo. Java (a linguagem que será vista nas duas primeiras fases do curso
de Ciência da Computação da UFSC) se encaixa no segundo caso.


Executando um programa a partir de um código
--------------------------------------------

Há diversas formas de se executar um programa a partir de um código. As mais
comuns são via **Compilação** e **Interpretação**.

Partindo do exemplo em Haskell abaixo, veremos como esses dois mecanismos podem
funcionar:

> Arquivo "exemplo.hs":
>
> ```haskell
> main = do putStrLn "Hello, World!"
> ```

### Compilação

> A partir de um programa escrito em uma linguagem, gerar um programa
> equivalente em outra linguagem.

No caso, a "outra linguagem" quase sempre será a linguagem de máquina, ou seja,
um código binário que seu processador consiga executar. Cada processador
implementa uma [ISA (Instruction Set
Architecture)](https://en.wikipedia.org/wiki/Instruction_set_architecture) que
especifica a forma de executar esse código binário. Por essa razão, um mesmo
binário que executa em um processador i5 (que implementa a ISA Intel x86_64)
não executa em um celular com processador ARM Cortex A53 (que implementa a ISA
ARMv8-A), já que as duas ISA's são incompatíveis.

Em Haskell, isso é possível de ser feito com o comando:

```
$ ghc exemplo.hs
```

Isso irá compilar o código no arquivo "exemplo.hs", gerando um arquivo de
código binário executável "exemplo" (no Linux) ou "exemplo.exe" (no Windows).
Uma versão humanamente legível desse executável pode ser visto com ferramentas
como `objdump exemplo`, mas entender o que ele significa demanda um pouco mais
de conhecimento. Esse binário, sendo compilado em um processador com ISA x86 ou
x86_64 (basicamente a maioria dos notebooks e desktops), poderá ser distribuído
para qualquer outro processador que implemente a mesma ISA (ou seja, qualquer
outro x86 ou x86_64, respectivamente), o que é uma vantagem. Porém, se
quisermos fazer esse mesmo programa rodar em um processador ARM, precisamos
recompilá-lo (instruindo o compilador -- no caso de Haskell, o `ghc` -- qual a
ISA alvo), o que dependendo do caso pode demorar muito tempo. Além disso,
qualquer mudança no código implica também em recompilação de pelo menos parte
dele (afinal, partes que não mudaram nem sempre precisam ser recompiladas).

Tendo o executável gerado, ele pode ser executado como qualquer outro, seja por
um clique duplo ou pelo terminal:

```
$ ./exemplo
Hello, world!
```

Esse é o mecanismo padrão de compilação, em que o código é compilado *antes* de
sua distribuição. Na recomendação [2](#recomendações-de-leitura) são descritos
outros dois métodos de compilação, inclusive um deles utilizado há bastante
tempo por Java e outro está para chegar para Java 10 (18.3).

### Interpretação

> Executar diretamente um programa escrito em uma linguagem.

Ou seja, em vez de o código ser compilado para um executável, apenas
distribuímos o próprio código, e ele será executado por um _Interpretador_.
Por exemplo, se tivermos um script em Python, salvo em um arquivo "hello.py":

```python
print("Hello, world!")
```

Podemos simplesmente chamar o comando `python`, passando o arquivo, e o código
dele será executado na hora:

```
$ python hello.py
Hello, world!
```

O mesmo pode ser feito com o código em Haskell, visto no exemplo de compilação.
Podemos, em vez de chamar o compilador de Haskell (`ghc`) para gerar um
executável e então rodá-lo, chamar o interpretador de Haskell (`runghc`)
passando o nome do arquivo com o código a ser executado:

```haskell
$ runghc exemplo.hs
Hello, world!
```

Uma das vantagens da interpretação (em comparação com a compilação) é o fato de
que geralmente o processo de compilação acaba sendo lento, e para muitas
ferramentas é mais importante verificar rapidamente se estão funcionando de
acordo fazendo diversas alterações em pouco tempo.


O caso de Java
--------------

> "E Java? É uma linguagem compilada e interpretada?"

No fundo, ser interpretada e ser compilada não é uma característica da
linguagem. É como perguntar se um parafuso é parafusado com chave de fenda ou
com uma parafusadeira: não é uma característica do parafuso, é apenas a
ferramenta que você utiliza no parafuso. Podemos pegar o exemplo de Haskell
logo acima: perceba que o código é literalmente o mesmo, mas em um momento o
compilamos com o `ghc`, e em outro momento o interpretamos com o `runghc`. E aí
pergunta-se: Haskell é compilada ou interpretada? A resposta é: você *pode*
compilar Haskell e você *pode* interpretar Haskell. É uma linguagem apenas, o
que você faz com ela é outra história. Se uma linguagem possui apenas
interpretador, nada impede alguém de criar um compilador para ela (e
vice-versa).

> **Observação**: Apesar do pedantismo, é "socialmente aceito" dizer "a
> linguagem X é compilada" em alguns casos como uma forma de dizer "ninguém
> interpreta ela, apenas em raríssimas exceções, se é que existem", e
> vice-versa.

Tendo isso em mente, o que podemos falar sobre Java é sobre o seu compilador
mais amplamente utilizado: o `javac` (que, por sinal, é feito em Java). `javac`
possui uma característica interessante: ele compila Java, mas não para a ISA do
processador do computador em que o programa irá rodar, e sim para uma linguagem
intermediária, chamada "bytecode". Esse bytecode pode ser interpretado
utilizando o programa `java` (obs: o programa, não a linguagem!), que nada mais
nada menos do que simula uma máquina, chamada JVM (_Java Virtual Machine_), que
executa esse bytecode.

Ou seja, basicamente temos um compilador de Java e um interpretador de
bytecode:

```
------------------     ---------     ------------
| Código em Java | --> | javac | --> | Bytecode |
------------------     ---------     ------------

------------     --------     -------
| Bytecode | --> | java | --> | JVM | --> Execução do programa
------------     --------     -------
```


Recomendações de leitura
------------------------

1. Paradigmas de programação: Imperativo? Funcional? Lógico?
2. Compilação AOT e JIT.
