Comentários
===========

Comentários são textos no seu código que serão completamente ignorados pelo
compilador. Servem para documentar o que seu código faz, ou como utilizá-lo, ou
mesmo dar pequenos avisos a programadores que forem ler seu código
eventualmente (incluindo você mesmo).

Em C++, há duas formas de comentar:
- Comentar apenas uma linha;
- Comentar um bloco de código.

Comentar uma linha é feito apenas escrevendo `//` a partir do ponto que se quer
deixar comentado. Por exemplo:

```c++
std::cout << "Este trecho é considerado pelo compilador\n"; // Este não
// E nem este, mesmo tendo: std::cout << "código C++\n";
```

Comentar um bloco de código é feito escrevendo `/*` onde se pretende começar o
comentário e `*/` onde se pretende terminá-lo:

```c++
#include <iostream>

int main() {
    std::cout << "Este trecho é considerado pelo compilador\n";

    /*
        Agora, a partir daqui não é mais:

        std::cout << "Isso nem irá aparecer no programa.\n";
        std : : cuot << "pode até" + . "errar a sintaxe e os nomes.
    */

    /* Funciona para parte de uma linha também */
}
```
