Sobre C++
=========

Por que usar C++?
-----------------

C++ é uma **Linguagem de Propósito Geral** (GPL -- _General Purpose Language_).
Ou seja, é projetada para que o programador decida onde será utilizada.
Por conta de algumas premissas descritas abaixo, há razões para compiladores de
C++ geralmente prezarem por gerar código otimizado. Em resumo, C++ pode ser
utilizado em lugares em que façam parte das preocupações do programador:

1. **Performance** ótima, previsível e garantida, e isso é oferecido pela
   linguagem graças aos seus compiladores principais: **g++**, **clang** e
   **CL** (este último para o Microsoft Visual Studio Community/Ultimate);
2. **Abstração** de operações, tipos, manipulação de memória, etc., sendo
   possível que operações e manipulações complexas possuam uma interfaces
   simples de se utilizar ou mesmo automatizar o gerenciamento de memória
   dinâmica **sem a necessidade de um Garbage Collector**;
3. **Compatibilidade de arquitetura**: como o g++ é análogo a um irmão do gcc
   (compilador de C), que possui uma longa data de existência (e portanto mais
   pessoas se dedicaram a portar o compilador para suas plataformas), é
   possível compilar código C++ para arquiteturas diversas, principalmente
   microcontroladores que costumam ser preocupantemente difíceis de se ter um
   compilador de outra linguagem para eles. É possível, por exemplo,
   desenvolver para processadores diversos processadores ARM, mesmo antigos
   como ARM7TDMI (processador do console GameBoyAdvance) ou novos como os
   Cortex (como o dos celulares Android modernos e vários microcontroladores),
   ao mesmo tempo que é possível desenvolver para processadores voltados a
   Desktops e Notebooks, como os Intel/AMD x86 e x86_64;
4. Recursos de programação moderna (a partir de C++11), mesmo para programação
   de software de base (como Sistemas Operacionais, _Device Drivers_, etc.):
   funções lambda, suporte a Threads, dentre outros;
5. Necessidade de reimplementação de recursos básicos: é possível implementar
   qualquer recurso da biblioteca padrão da linguagem sem a necessidade de uma
   segunda linguagem, mantendo código eficiente, reutilizável e seguro. Assim,
   é possível ter uma implementação de algumas abstrações de uma forma para um
   sistema limitado em processamento ou memória, e de outra para um sistema em
   que restrições de processamento e memória não sejam um problema.
6. **Zero-cost Abstractions** (Abstração de custo zero): é possível escrever
   camadas de abstração em C++ (seja para conectar duas interfaces
   não-compatíveis, ou oferecer uma API adequada a partir de outra, ou
   construir uma API completamente nova e independente) sem que isso imponha
   custo adicional. O compilador deve capaz de otimizar e eliminar tais camadas
   sempre que possível (por exemplo, uma chamada para função que retorne um
   valor fixo é substituída pelo próprio valor retornado), dentre outras
   otimizações relacionadas a abstração (seja de tipos, operações ou
   arquitetura);
7. **Semântica de _"move"_**: a linguagem oferece a possibilidade de evitar
   cópias desnecessárias (ou que não devem existir) em contextos diversos.


Apelo: atualizações na linguagem
--------------------------------

Um pequeno apelo a ser feito é sempre procurar informações atualizadas a
respeito da linguagem. O motivo é que, em 2011, um novo padrão da linguagem foi
aceito e incorporado a ela, chamado de C++11. Esse novo padrão define novos
recursos que melhoraram a qualidade da linguagem de deixando-a desde mais
segura e robusta a uma linguagem mais moderna, simplificando bastante a forma
de se programar nela. Logo, a forma de se programar em C++ pré-11 pode ser dita
como obsoleta. Inclusive, o advento de C++14 e C++17 (lançados em 2014 e 2017,
respectivamente), já fazem de C++11 um padrão obsoleto em algumas partes.

Como exemplo, o código abaixo exemplifica a criação e iteração por elementos de
um Map em C++ antigo (pré-C++11):

```c++
std::map<std::string, int> data = std::map<std::string, int>();
data.insert(std::pair<std::string, int>{"x", 4});
data.insert(std::pair<std::string, int>{"y", 4});
data.insert(std::pair<std::string, int>{"z", 12});

for (std::map<std::string, int>::iterator it = data.begin();
     it != data.end();
     ++it) {
    std::cout << it->first << ": " << it->second << "\n";
}
```

O mesmo código, em C++11:

```c++
auto data = std::map<std::string, int>{
    {"x", 4},
    {"y", 4},
    {"z", 12},
};

for (auto elm: data) {
    std::cout << elm.first << ": " << elm.second << "\n";
}
```

E por fim, em C++17:

```c++
auto data = std::map<std::string, int>{
    {"x", 4},
    {"y", 4},
    {"z", 12},
};

for (auto [key, value]: data) {
    std::cout << key << ": " << value << "\n";
}
```

Comparando com um código equivalente em Python:

```python
data = {
    'x': 4,
    'y': 4,
    'z': 12,
}

for key, value in data:
    print(f'{key}: {value}')
```

Isso deve deixar claro por que buscar trabalhar com C++ moderno.

C++ é C com std::cout?
----------------------

Não, C++ não é C com `std::cout`. Como C++ surgiu baseada em C (inclusive, suas
primeiras implementações geravam código C) e sempre prometeu uma certa
retrocompatibilidade com C, é comum ver construções em ambas as linguagens que
sejam parecidas, ou mesmo código em C que compile em C++. Por consequência, se
criam crenças de que entender de C implica em entender de C++ (e vice-versa),
além de ser comum programadores escreverem código C no meio de código C++. Mas,
serve de regra:

> C em código C++ é C++ ruim.

Por exemplo: em C é comum e necessário trabalhar com ponteiros explicitamente.
Em C++ isso é, para praticamente todo caso, um erro (por conta de diversos
problemas de segurança relacionados a ponteiros, _undefined-behaviours_ não
muito óbvios ao programador, e por C++ oferecer recursos melhores para
gerenciá-los). O mesmo se aplica ao uso da diretiva `#define`: para se escrever
código genérico em C, `#define` é essencial. Porém C++ possui seu próprio
mecanismo de código genérico:
[Templates](https://en.cppreference.com/w/cpp/language/templates), que reduzem
a possibilidade de erros (veja a
[Recomendação de Leitura #1](#recomendações-de-leitura)) e aproveitam melhor o
sistema de tipos da linguagem.

C++ é próxima do hardware, assim como C?
----------------------------------------

Não, pelos mesmos motivos pelo qual
[C também não é](https://queue.acm.org/detail.cfm?id=3212479).

Recomendações de Leitura
------------------------

1. [#define's são seguros?](/langs/c/defines-are-evil.md)
