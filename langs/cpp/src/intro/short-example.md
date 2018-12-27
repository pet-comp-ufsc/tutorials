Explicação do código de exemplo
===============================

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
tela). Dessa maneira, `std::cout << "Texto"` irá mostrar "Texto". Por fim, o
`\n` apenas indica para pular a linha após "Hello, world!".

