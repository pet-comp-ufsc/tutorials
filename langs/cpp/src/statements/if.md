If
==

No caso da estrutura `if`, o controle do fluxo de execução do programa é dado
por uma condição: se algo for verdadeiro, então o programa toma uma ação, mas
caso não seja, outra ação é tomada no lugar.

Sintaxe
-------

A sintaxe de um `if` é:

```c++
if (/* <condição 1> */) {
    /* <escopo 1> */
} else if (/* <condição 2> */) {
    /* <escopo 2> */
} else {
    /* <escopo 3> */
}

/* <após o if> */
```

Quando seu programa executar, caso a `<condição 1>` dê `true`, o programa
executa o que está no `<escopo 1>` e em seguida vai para `<após o if>`.

Caso a `<condição 1>` dê `false`, é verificada a `<condição 2>`. Se ela der
`true`, o programa executa o que está no `<escopo 2>` e em seguida vai para
`<após o if>`.

Por fim, caso nenhuma das condições seja `true`, o `<escopo 3>` (o do `else`) é
executado (e, assim como os outros, depois vai para `<após o if>`.

Observações:
- O `else if` e `else` são opcionais;
- É possível elencar quantos `else if`s você quiser. Eles serão checados um por
  um, em ordem, até que algum deles dê `true`.

Exercício
---------

O programa abaixo deveria, dado o primeiro argumento (desconsiderando o nome do
programa), informar se o número apostado é maior, menor ou igual a um número
secreto. Porém, o programa está incompleto.

Seu exercício é completar o programa no trecho que se pede.

```c++
#include <iostream>

// disponibiliza o `std::stoi`
#include <string>

int main(int argc, char* argv[]) {
    // verifica se foi passado o argumento com o número
    if (argc < 2) {
        std::cout << "Faltou passar o número apostado!\n";

        // Caso não tenha passado, o main se encerra com um código de erro
        return -1;
    }

    const auto SECRET_NUMBER = 12;

    // converte o 1º argumento de string para int, armazenando o resultado em
    // `guess`
    auto guess = std::stoi(argv[1]);

    // checa se o número apostado está correto, ou se é menor ou igual ao
    // secreto
    /* apague esta linha e escreva seu código */
}
```

Dicas:
1. Comparações entre números podem ser feitas com os operadores descritos no
   tutorial [Outros/Operadores](../others/operators.md).
2. Se `x` não é menor nem igual a `y`, então `x` com certeza é maior que `y`.
