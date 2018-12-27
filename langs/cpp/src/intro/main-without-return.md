Ausência de return no main
==========================

Em C++, a única função que não exige retorno (ao menos de maneira segura, então
se alguma outra função compilar mesmo sem colocar o retorno: cuidado) é a
`main`. Nesse caso, por padrão o retorno é 0. O retorno de `main` é utilizado
por quem executou o programa para saber se ele chegou ao fim com sucesso (ou
seja, retorno 0) ou ocorreu alguma falha (ou seja, retorno negativo). As falhas
podem número de envolver argumentos (serão vistos mais à frente) insuficientes
(o programa exigia 4 argumentos, mas foram passados 3, 5 ou mesmo nenhum),
programa interrompido pelo usuário, dentre outros.
