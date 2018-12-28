Sobre C#
========

Apesar do nome, C# tem muito mais a ver com Java do que com C e C++, incluindo
padrões de projeto, nomenclatura, forma de trabalho, organização, etc...
Basicamente o que C#, C e C++ possuem em comum é ponteiros (e ainda assim não
funciona da mesma forma, mas dificilmente você os utiliza em C#, por questões
de segurança - mas vale lembrar que todo objeto é uma referência), e trabalha
com tipos primitivos de uma forma mais próxima de C e C++ (inclusive na
definição do tamanho deles: em C# há uint8, uint16, uint32, uint64, int8,
int16, int32, int64, ...). Específico em relação a C++, C# também possui
namespaces (o que é ótimo!).

Mas apesar da semelhança com Java, C# é uma linguagem bem elaborada, com
bibliotecas com APIs bem fáceis de usar, não costuma ser difícil de lidar com
ela, e ainda consegue manter uma certa liberdade ao programador e suas
implementações costumam ter uma performance muito boa.

Para quem conhece Java, C# possui um sistema de get/set (adicionando Operator
Overloading, o que é ótimo também), _callbacks_ e
[_lambdas_](https://en.wikipedia.org/wiki/Anonymous_function) muito bem feitos
e fáceis de usar. Outra característica importante é que C# já possui inferência
de tipo (via `var`) desde Visual C# 3.0 (lançado em 2007).

Há ainda, porém, a mesma restrição de Java quanto a arquivos: todo arquivo
`.cs` deve expor uma classe pública no escopo mais externo (fora namespaces).
