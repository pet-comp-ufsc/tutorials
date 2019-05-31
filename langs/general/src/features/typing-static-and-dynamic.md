Tipagem Estática e Dinâmica
===========================

Um resumo
---------

Tipagem estática é desejada para:
- Ter garantias em tempo de compilação (satisfazer operações para determinados
  tipos de dados, etc.);
- Aproveitar **overload** de função;
- Facilitar otimizações do compilador.

Tipagem dinâmica é desejada para:
- Prototipagem rápida;
- Flexibilidade (Duck Typing, por exemplo);
- Produtividade.

Tipagem Estática
----------------

De maneira simples:

<concept title="Tipagem Estática">
  Quando o sistema de tipos **obriga** que os tipos de **todos** os objetos¹ e
  funções do programa são conhecidos sem ser necessário executá-lo.
</concept>

¹: "Objeto" aqui não se refere ao conceito de Orientação a Objetos, mas sim no
sentido de um valor, seja na forma de uma variável, um literal, ou o resultado
de uma expressão.

Isso significa que, em uma linguagem de tipagem estática, é **impossível** que
um programa compile sem que se possa conhecer o tipo de algum objeto. De uma
forma prática, isso significa que, por exemplo, se Python possuisse um sistema
de tipos estático, a função abaixo jamais seria uma função válida:

```py
def process(data):
    if data is not None:
        return 0

    return 'It was None'
```

Ora, mas por que seria impossível? Para perceber isso, tente definir qual o
tipo de retorno de `process`. Se `data` for `None`, pula-se o `if` e o retorno
é uma `str`. Porém se `data` não for `None`, entra-se no `if` e o retorno é um
`int`.  É um exemplo bobo sem propósito exato, mas já é um código Python
**válido**, porém que não se pode definir o resultado de uma função.

Outro exemplo, também em Python, é quando há a reatribuição de uma variável
para tipos diferentes:

```py
x = True
x = 10
x = 'Hello'
```

Nesse caso, qual é o tipo de `x`? É um `bool`, um `int` ou uma `str`? É
impossível determinar um único tipo, dada a especificação de Python.

<warn title="Especificações da linguagem">
    Apesar disso tudo, nada impede que alguém crie uma linguagem que especifica
    que, para esses casos, o tipo da variável (ou do retorno) seja um
    `Variant[bool, int, str]` no caso do último código Python, ou `Variant[int,
    str]` no caso da função `process`. Caso não saiba o que é um Variant, leia
    um pouco sobre [aqui](https://en.wikipedia.org/wiki/Variant_type).
</warn>

Perceba que nada disso significa que coisas como _templates_ façam com que C++
não tenha tipagem estática, veja:

```cpp
template <typename T>
T process(const T& data) {
    if (data.foo()) {
        return data.bar();
    }

    return T{};
}
```

Perceba: apesar de que por esse trecho não há uma indicação específica de qual é o tipo de `data` ou do retorno de `process`, ...
