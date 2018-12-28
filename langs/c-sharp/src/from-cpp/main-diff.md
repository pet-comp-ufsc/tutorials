Principais Diferenças
=====================

_(OBS: Este tutorial encontra-se bastante incompleto. Se puder, ficaremos
gratos em receber um [Pull Request](https://github.com/pet-comp-ufsc/tutorials)
seu)_

Se você veio de C++, o caminho é bem mais simples quanto
[se você viesse de C](../from-c/about.md).

Assim como foi feito com C, segue uma pequena tabela com algumas das diferenças
entre C# e C++:

| Recurso          | C                                | C#                                                        |
|------------------|----------------------------------|-----------------------------------------------------------|
| Ponteiros        | Sim                              | Não¹                                                      |
| Classes/Objetos  | Sim. Não herdam por padrão       | Sim, e definem **ReferenceTypes**². Herdam de Object.     |
| Structs          | Sim                              | Sim, mas definem **ValueTypes**²                          |
| Macros           | Sim                              | Sim³                                                      |
| Namespaces       | Sim                              | Sim                                                       |
| Function-pointer | Sim                              | Possui Delegates e Events                                 |
| Herança          | Sim                              | Sim                                                       |
| Interface        | Sim (classes puramente virtuais) | Sim (com a keyword `interface`)                           |
| Templates        | Sim                              | Possui Generics⁴                                          |

¹: Sim, mas apenas em um bloco `unsafe`.

²: [ValueTypes](https://msdn.microsoft.com/en-us/library/s1ax56ch.aspx) e
   [ReferenceTypes](https://msdn.microsoft.com/en-us/library/490f96s2.aspx) são
   conceitos já conhecidos em C++, mas vale ver em que contextos C# trata um ou
   outro.

³: C# tem macros, mas não da mesma forma que C: elas apenas definem símbolos
   que podem ser utilizados em `#ifndef`, por exemplo, mas não servem para
   definir constantes. Também não há a necessidade de _include-guards_.

Uma das maiores diferenças que você provavelmente irá notar é que, em C#, tudo
precisa estar em uma classe, não existe nada “solto” (incluindo o `main`, que
fica marcado como um método estático e os argumentos da linha de comando ficam
em um array de strings).

No geral não haverão muitas diferenças na forma de modelar o código. Algumas
nomenclaturas, apesar de iguais, funcionam de forma diferente. São elas:

`using`
-------

- Um `using` não pode ser utilizado dentro de qualquer escopo como em C++;
- `using`, em C#, possui três funções:
  - Incluir namespaces, como o `using` do C++ mesmo, porém apenas no escopo
    geral;
  - Criar _aliases_ para Namespaces;
  - Criar _aliases_ para classes (serve tanto para resolver ambiguidade quanto
    para importar apenas o que precisar de uma determinada namespace).

`struct`
--------

- Não há a diferença de modificador de acesso padrão entre Classes (que em C++
  é `private`) e Structs (que em C++ é `public`): o padrão de ambos é
  `internal`;
- Structs, por serem ValueTypes, são sempre recebidas como cópia: não há como
  enviar uma referência de uma struct senão indicando explicitamente com a
  _keyword_ `ref` (é necessário que a função também defina o parâmetro como
  `ref`, e nesse caso *apenas* `ref`s podem ser passadas para aquele parâmetro
  em específico).

Outras diferenças menores
-------------------------

- Para acessar um elemento de uma _namespace_ se utiliza `namespace.something`
  em vez de `namespace::something`;
- `++i` e `i++` não possuem diferença de performance;
- ___TODO___

### std::optional

Em C#, apesar de que ValueTypes não são referências, é possível criar uma
versão "Nullable" deles utilizanod um `?` após o tipo. Ela acaba funcionando
como `std::optional`, e pode ser vista [aqui](some-features.md#nullables):
