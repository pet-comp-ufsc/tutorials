Funções com retorno "void"
--------------------------

Em alguns momentos, serão criadas funções para apenas para facilitar a
manutenção (minimizando a quantidade de responsabilidades de uma função maior)
ou não repetir o mesmo código ao longo do projeto, sem a intenção de dar uma
resposta. Nesses casos, utilizamos o tipo `void` no retorno:

```java
void doSomething() {
    for (var i = 0; i < 3; i++) {
        System.out.println("I'm doing something important...");
    }
}
```

Nessa função, estamos criando uma função (chamada `doSomething`) que não recebe
parâmetros e também não entrega uma resposta, apenas executa comandos.

Inclusive, até o momento vimos uma função com retorno `void`: a função `main`.
