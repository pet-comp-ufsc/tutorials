Ausência de return no main
==========================

Em C++, a única função que não exige retorno (ao menos de maneira segura, então
se alguma outra função compilar mesmo sem colocar o retorno: cuidado) é a
`main`.

Em outras palavras, a `main` é a única função na qual se pode retirar a linha
iniciada com `return` do código abaixo:

```c++
int main() {
    return 0; // opcional
}
```

Quando não é colocada essa linha, o compilador já entende o retorno como 0.

O retorno de `main` é utilizado por quem executou o programa para saber se ele
chegou ao fim com sucesso (retorno 0) ou ocorreu alguma falha (retorno
negativo). As falhas podem número de envolver:
- Argumentos\* insuficientes (o programa exigia 4 argumentos, mas foram
  passados 3, 5 ou mesmo nenhum);
- Programa interrompido pelo usuário;
- O programa (ou algum outro que ele inicia) não existe;
- Algum dos argumentos enviados é inválido (ainda que a quantidade esteja
  correta).

Dentre outros.

\*: o conceito de "argumentos" será visto no próximo tópico.
