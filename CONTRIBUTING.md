Contribuindo
============

Índice
------

1. [Guia de estilos](#guia-de-estilos)
    1. [Hierarquia de pastas](#hierarquia-de-pastas)
    2. [Estrutura de um tópico](#estrutura-de-um-tópico)
    3. [Cabeçalhos](#cabeçalhos)
    4. [Conteúdo](#conteúdo)
2. [Adicionando tutoriais/artigos](#adicionando-tutoriaisartigos)
    1. [Compilando o livro](#compilando-o-livro)
    2. [Orientações gerais](#orientações-gerais)

Guia de estilos
---------------


### Hierarquia de pastas

No momento, o projeto está organizado da seguinte forma:

```
.
├── arch           # Tutoriais de arquitetura
├── css            # [Código-fonte] CSS adicional
├── general        # Tutoriais gerais
├── js             # [Código-fonte] JS adicional
├── langs          # Tutoriais sobre linguagens
│   ├── c          # ...
│   ├── cpp
│   ├── c-sharp
│   ├── java
│   ├── latex
│   └── python
├── main           # Página principal do livro (com índice e categorias)
└── tools          # Tutoriais sobre ferramentas
```

Com exceção das pastas com código-fonte do livro (`css` e `js`), todas as
outras possuem uma pasta `src` e um `book.toml`. O `book.toml` possui as
configurações de cada sub-livro (conforme [documentação do
MdBook](https://github.com/rust-lang-nursery/mdBook/blob/master/book-example/src/format/config.md).
`src` é a pasta que contém cada arquivo Markdown com cada tópico de seu
respectivo sublivro. É interessante que cada subtópico seja uma pasta separada
dentro de `src`, para fins de organização (assim não ficam todos os tópicos e
subtópicos jogados em `src`).


### Estrutura de um tópico

É sugerida a seguinte estrutura para cada tópico:

**(OBS: o índice é opcional, utilizado apenas quando for um tópico muito
grande, o que é comum no caso das ferramentas, já que não há um sublivro para
cada.)**

```
Título principal
================

Índice (Opcional)
------

1. [Tópico 1](#topico-1)
    1. [Subtópico 1.1](#subtopico-1-1)
    2. [Subtópico 1.2](#subtopico-1-2)
2. [Tópico 2](#topico-2)
3. [Recomendações de leitura](#recomendações-de-leitura)
4. [Bibliografia](#bibliografia)

Tópico 1
--------

### Subtópico 1.1

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.

### Subtópico 1.2

Chega de Lipsum por hoje.

Tópico 2
--------

Mais conteúdo. Desta vez, suponhamos que aqui tenha uma referência a
[1](#bibliografia).

Recomendações de leitura
------------------------

1. [Link 1](links.com/link-1)
2. [Link 2](links.com/link-2)
3. [Link 3](links.com/link-3)

Bibliografia
------------

1. [Link 1](links.com/link-1)
   Descrição opcional.
2. [Link 2](links.com/link-2)
   Descrição opcional.
3. [Link 3](links.com/link-3)
   Descrição opcional.
```

### Cabeçalhos

Utilize uma linha (com o mesmo número de caracteres do cabeçalho) contendo
apenas "=" (título) ou "-" (subtítulo) logo abaixo do título do cabeçalho.
Para mais níveis de subtítulo, utilize `#`.

```
Header 1
========

Header 2
--------

Header 2 (um pouco maior)
-------------------------

### Header 3

#### Header 4
```


### Conteúdo

1. Não passar da coluna 80.
2. Preferir incluir uma seção com prática em cada tutorial (dadas as devidas
   exceções).

_(outros tópicos a incrementar)_

Adicionando tutoriais/artigos
-----------------------------

### Compilando o livro

Para compilar o livro, execute:

```console
$ ./build.sh build --local
```

No momento o sistema de sublivros não está muito robusto, então é provável que
o `mdbook serve` não funcione corretamente (e portanto a função `serve` do
`build.sh` também não). Por consequência, o que tenho feito é abrir o
`index.html` de cada livro utilizando a navegação de arquivos do próprio
navegador (ou seja, com `file:///`).

### Orientações gerais

1. Siga o guia de estilos;
2. Se o tutorial for relacionado a código (bibliotecas, dicas, etc.), deixe
   alguns exemplos.
3. Se o tutorial possuir códigos de exemplo, certifique-se de que o código
   compila ou é extraído de um trecho compilável;
4. Ao referenciar sites, procure linká-los. Por exemplo:

   ```
   Para mais informações, cheque o [site oficial da
   Foo-platform](fooplatform.com)
   ```

5. Procure deixar recomendações de leitura no final do tutorial;
6. Se algo já foi explicado noutro tutorial, procure linká-lo (se possível
   indicando qual tópico está relacionado diretamente com a explicação).

Recomendações de Leitura
------------------------

1. [Sintaxe de Markdown válida no Github](https://guides.github.com/features/mastering-markdown/)
