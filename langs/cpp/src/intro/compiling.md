Compilando com g++
==================

Para compilar um arquivo (supondo que o código do "Hello, World" esteja salvo
como "hello.cpp") com o `g++`, basta executar em um terminal:

```console
g++ hello.cpp
```

Isso irá gerar um arquivo com nome padrão ("a.out"). Esse arquivo pode ser
executado diretamente:

```console
$ ./a.out
Hello, world!
```

Caso queira definir o nome do executável final, existe a flag `-o <nome>`:

```console
$ g++ hello.cpp -o hello
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

```console
$ g++ hello.cpp -o hello -std=c++11
```

Isso fará compilar com C++11. `-std=c++14` para C++14, e por aí vai. Vale
lembrar que antes de um padrão de C++ ficar pronto ele é disponibilizado com
uma flag específica. Por exemplo, antes de C++11 ficar pronto, a flag era
`-std=c++0x`. Antes de C++14 ficar pronto, a flag era `-std=c++1y`, e antes de
C++17 ficar pronto, a flag era `-std=c++1z`. Por fim, para utilizar C++20 (que
[ainda não está pronto](https://en.cppreference.com/w/cpp/compiler_support)), a
flag é `-std=c++2a`.
