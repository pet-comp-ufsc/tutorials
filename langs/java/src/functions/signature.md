Assinatura de uma função
========================

Uma função é identificada pela sua **assinatura**. A assinatura de uma função é
composta pelo **nome e tipos dos parâmetros** (observe que **o tipo de retorno
_NÃO_ faz parte da assinatura**). Assim, o compilador é capaz de diferenciar
duas funções apenas analisando a assinatura delas. Por exemplo:

```java
void foo() { ... }
void foo(int x) { ... } // OK, outra função
void foo(int otherParamName) { ... } // Erro: foo(int) já foi definida
int foo() { ... } // Erro: foo() já foi definida
int foo(int x) { ... } // Erro: foo(int) já foi definida
```
