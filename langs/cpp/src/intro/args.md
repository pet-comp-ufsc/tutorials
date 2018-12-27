Argumentos do programa
======================

Os argumentos de um programa são informações adicionais mandadas a ele, por
exemplo: seu programa abre uma imagem, mas qual imagem deve abrir? Ou seu
programa converte um arquivo em um formato de áudio para outro formato: qual
arquivo será convertido e qual o nome do arquivo gerado?

Os argumentos do programa podem ser acessados mudando a definição de `main`
para:

```c++
int main(int argc, char* argv[]) {
    std::cout << "Num. of arguments: " << argc << '\n';

    std::cout << "First arg: " << argv[0] << '\n';
}
```

Em que `argc` conterá *quantos* argumentos foram passados e `argv` conterá
*quais* os argumentos passados. O _n-ésimo_ argumento de um programa pode ser
acessado com `argv[n-1]`, ou seja: o 1º argumento é guardado em `argv[0]`, o 2º
em `argv[1]`, e por aí vai. Vale lembrar que o primeiro argumento (`argv[0]`) é
sempre o nome do programa.

Exercício
---------

Faça o programa acima compilar (dica: está faltando importar a definição de
`std::cout`) e o execute com:

```console
$ ./<programa> Works!
```

Qual a saída da execução? O que acontece se você trocar `Works!` para `It
works!`?
