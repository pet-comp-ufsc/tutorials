Sobrecarga
==========

É possível, em várias linguagens de programação, definir duas ou mais funções
de mesmo nome, porém com os tipos dos parâmetros diferentes. Assim, o
compilador olha quais valores foram passados por parâmetro para uma função para
descobrir qual deve ser chamada. Por exemplo:

```java
void foo() {
    System.out.println("Calling foo()...");
}

void foo(int x) {
    System.out.printf("Calling foo(%d)...\n", x);
}

void foo(String s) {
    System.out.printf("Calling foo(%s)...\n", s);
}

void foo(String s, int x) {
    System.out.printf("Calling foo(%s, %d)...\n", s, x);
}


void main(String[] args) {
    foo();          // => Calling foo()...
    foo(3);         // => Calling foo(3)...
    foo("Hey", 2);  // => Calling foo(Hey, 2)...
    foo("Dude");    // => Calling foo(Dude)...
}
```

Esse mecanismo (de poder ter funções com mesmo nome, porém tipos dos parâmetros
diferentes) se chama "Sobrecarga de função". Perceba que é essencial que as
funções mantenham uma **assinatura** diferente.
