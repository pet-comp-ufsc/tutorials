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

No [Exemplo 1](#exemplo-1), temos a definição de uma função (de matemática
mesmo) chamada "`square`". Na primeira linha, estamos instruindo que `square`
pega um número inteiro e entrega como resposta outro número inteiro. Na segunda
linha, indicamos que esse inteiro se chama `x`, e a resposta de square é x
multiplicado por ele mesmo (elevando ao quadrado). A linguagem utilizada nesse
exemplo é [Haskell](haskell.org/).

Já no [Exemplo 2](#exemplo-2), temos um pequeno programa que pede ao usuário
para digitar um número inteiro. Esse pedido é feito pelo `input('mensagem')`.
Em seguida, enquanto o número for menor que 0 (ou seja, negativo), informamos o
usuário do erro e pedimos para ele digitar outro número. Se o número deixar de
ser negativo, então o programa passa para a próxima etapa, que é mostrar o
número escolhido pelo usuário. A linguagem utilizada nesse exemplo é
[Python](python.org), uma linguagem do paradigma imperativo (ver a recomendação
[1](#recomendações-de-leitura)).

Essas duas linguagens possuem formas completamente diferentes de se descrever
problemas nelas, visto que a primeira é do que chamamos de "paradigma
funcional" (ver a recomendação [1](#recomendações-de-leitura)) e outra do
"paradigma imperativo". Java (a linguagem que será vista nas duas primeiras
fases do curso) se encaixa no segundo caso.


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

> ### Compilação
>
> A partir de um programa escrito em uma linguagem, gerar um programa
> equivalente em outra linguagem.

No caso, a "outra linguagem" quase sempre será a linguagem de máquina, ou seja,
um código binário que seu processador consiga executar. Cada processador
implementa uma [ISA (Instruction Set
Architecture)](https://en.wikipedia.org/wiki/Instruction_set_architecture) que
especifica a forma de executar esse código binário. Por essa razão, um mesmo
binário que executa em um processador i5-4210 (que implementa a ISA Intel
x86_64) não executa em um celular com processador ARM Cortex A53 (que
implementa a ISA ARMv8-A), já que as ISA's não são as mesmas.

Em Haskell, isso é possível de ser feito com o comando:

```bash
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

Esse é o mecanismo padrão de compilação, em que o código é compilado *antes* de
sua distribuição. Na recomendação [2](#recomendações-de-leitura) são descritos
outros dois métodos de compilação, inclusive um deles utilizado há bastante
tempo por Java e outro introduzido em Java 10.

> ### Interpretação
>
> Executar diretamente um programa escrito em uma linguagem.

__Descrever python e etc. aqui__


Recomendações de leitura
------------------------

1. Paradigmas de programação: Imperativo? Funcional? Lógico?
2. Compilação AOT e JIT.


Bibliografia
============

