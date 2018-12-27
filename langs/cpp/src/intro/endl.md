std::endl
=========

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

