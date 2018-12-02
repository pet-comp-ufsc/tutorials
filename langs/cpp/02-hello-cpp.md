Hello World - C++
=================

Compilando com g++
------------------

Vamos direto a um código de exemplo:

```c++
#include <iostream>

int main() {
    std::cout << "Hello, world!\n";
}
```

Como é de se imaginar, é o clássico código que mostra o texto "Hello, world!"
no console.

Para compilar um arquivo (supondo que o código acima esteja salvo como
"arquivo.cpp") com o `g++`, basta fazer:

```bash
g++ arquivo.cpp
```

Isso irá gerar um arquivo com nome padrão ("a.out"). Esse arquivo pode ser
executado diretamente:

```bash
$ ./a.out
Hello, world!
```

Caso queira definir o nome do executável final, existe a flag `-o <nome>`:

```bash
$ g++ arquivo.cpp -o hello
$ ./hello
Hello, world!
```

### Especificando a versão de C++

Dependendo da versão do compilador que estiver utilizando, a versão padrão de
C++ utilizada será diferente:

| Compilador | Versão | Padrão |
|------------|--------|--------|
| g++        | 8.x    | c++17  |
| g++        | 7.x    | c++17  |
| g++        | 6.x    | c++14  |
| g++        | 5.4    | c++11  |
| g++        | <5.4   | c++03  |

É possível explicitar a versão do padrão de C++ utilizando a flag `-std`:

```bash
$ g++ arquivo.cpp -o hello -std=c++11
```

Isso fará compilar com C++11. `-std=c++14` para C++14, e por aí vai. Vale
lembrar que antes de um padrão de C++ ficar pronto ele é disponibilizado com
uma flag específica. Por exemplo, antes de C++11 ficar pronto, a flag era
`-std=c++0x`. Antes de C++14 ficar pronto, a flag era `-std=c++1y`, e antes de
C++17 ficar pronto, a flag era `-std=c++1z`. Por fim, para utilizar C++20 (que
[ainda não está pronto](https://en.cppreference.com/w/cpp/compiler_support)), a
flag é `-std=c++2a`.

Explicação do código de exemplo
-------------------------------

A primeira linha é demarcada por um `#include`:

```c++
#include <iostream>
```

Comandos iniciados com `#` são **diretivas de pré-processador**, que são
processadas antes do código ser efetivamente compilado. No caso da `#include`,
ela indica que o conteúdo de um arquivo deve ser incluído naquele ponto. Para
buscar esse arquivo, foi utilizado `<>` para dar preferência às bibliotecas do
sistema. Caso a preferência fosse por arquivos na pasta atual, seria utilizado
`""`, mas isso será visto melhor mais tarde.

Sendo assim, em resumo, está sendo incluído o conteúdo do arquivo "iostream",
presente na biblioteca padrão de C++.

Mais à frente é criada uma função chamada `main` com tipo de retorno `int`:

```c++
int main() {
```

Essa função é responsável por ser o ponto de início do programa. Ou seja,
quando `a.out` foi executado, ela foi o ponto de entrada do programa. As chaves
(`{}`) delimitam o que chamamos de Escopo, e o Escopo de uma função são os
comandos que ela executa quando chamada.

O que `main` executa ao ser chamada é apenas chamar o operador `<<` de `cout`:

```c++
    std::cout << "Hello, world!\n";
```

O `<<` é o chamado "operador de left-shift", que é utilizado para deslocar os
bits de números inteiros (ou seja, um número cujos bits fossem `0110`,
deslocado 2 bits à direita ficaria `0001`). Porém, `std::cout` é uma instância
de um tipo definido na biblioteca padrão, e esse tipo define seu próprio
comportamento para quando `<<` é utilizado sobre ele. No caso, o comportamento
definido é redirecionar o texto para a saída do console (ou seja, mostrar na
tela0. Dessa maneira, `std::cout << "Texto"` irá mostrar "Texto". Por fim, o
`\n` apenas indica para pular a linha após "Hello, world!".

Ausência de return no main
--------------------------

Em C++, a única função que não exige retorno (ao menos de maneira segura, então
se alguma outra função compilar mesmo sem colocar o retorno: cuidado) é a
`main`. Nesse caso, por padrão o retorno é 0. O retorno de `main` é utilizado
por quem executou o programa para saber se ele chegou ao fim com sucesso (ou
seja, retorno 0) ou ocorreu alguma falha (ou seja, retorno negativo). As falhas
podem envolver argumentos insuficientes (o programa exigia 4 argumentos, mas
foram passados 3, 5 ou mesmo nenhum), programa interrompido pelo usuário,
dentre outros.

Os argumentos do programa podem vir mudando a definição de `main` para:

```c++
int main(int argc, char* argv[]) {
    std::cout << "Num. of arguments: " << argc << '\n';

    std::cout << "First arg: " << argv[0] << '\n';
}
```

Ou seja, `argc` conterá *quantos* argumentos foram passados, e `argv` contém
*quais* os argumentos passados. Vale lembrar que o primeiro argumento
(`argv[0]`) é sempre o nome do programa.

std::endl
---------

É comum ver exemplos de código da forma:

```c++
std::cout << "Texto" << std::endl;
```

O `std::endl`, assim como o `\n`, serve para pular linha. Porém ele **não**
deve ser usado de maneira desleixada, pois além de pular linha, ele também
força um "flush" na saída do console (ao contrário do caractere `\n`, que
apenas é um caractere que, ao ser mostrado, será interpretado como quebra de
linha). O "flush" serve para forçar o texto a ser escrito na tela, o que é uma
operação lenta (não muito, mas se feita muitas vezes tem um efeito
perceptível), e pode servir para situações como:

```c++
std::cout << "Texto que eu preciso que seja mostrado" << std::endl;
funcao_que_pode_dar_erro();
```

Se a função acabar jogando um erro, o texto ainda será mostrado (afinal, está
sendo forçada a escrita dele na tela). Com apenas `\n`, o texto seria escrito
quando o buffer de saída do console enchesse (por exemplo, mandar exibir textos
muito grandes, ou mandar várias exibições de texto) ou quando um certo tempo
passase (que é bastante curto), assim caso a função `funcao_que_pode_dar_erro`
jogasse um erro, o texto estaria apenas em um buffer temporário, mas não seria
escrito na tela.
