Variáveis
=========

Pequeno Exemplo
---------------

O exemplo abaixo ilustra um pequeno programa que cria variáveis e mostra o
valor de cada uma delas:

```java
public class VariablesExample {
    public static void main(String... args) {
        int x = 0;
        int y = 3;

        double z = 10.0;

        System.out.println(x);
        System.out.println(y);
        System.out.println(z);
    }
}
```

Nesse exemplo, foram criadas três variáveis: duas representando números
inteiros (simbolizado pelo `int` antes do nome delas) e outra representando um
número real (simbolizado pelo `double`). Perceba que essas variáveis recebem
nomes: `x`, `y` e `z`. Esse nome é chamado de **identificador**, e serve para
referenciar ou guardar um dado (veremos mais adiante quanto ao conceito de
referência). Executando o exemplo:

```
$ javac VariablesExample.java
$ java VariablesExample
0
3
10
```

Para criar uma variável, deve-se seguir o padrão:

```java
tipo identificador = valor;
```

- **Tipo**: O tipo de dado a ser guardado ou referenciado pela variável. Veja
  em [Tipos de dados](#tipos-de-dados) para ver o que se pode utilizar.

- **Identificador**: O nome que utilizaremos para a variável.
  Podemos nos referir a uma variável através de seu identificador, como visto no
  pequeno exemplo. Podemos, inclusive, utilizar uma variável para dar valor a
  outra:

  ```java
  int x = 10;
  int y = x;
  ```

  Nesse caso, tanto x quanto y guardam o valor 10. Se fizermos, porém:

  ```java
  int x = 10;
  int y = x;
  x = 4;
  ```

  A variável `x` terá mudado de valor para 4, porém `y` manterá o valor 10.
  Inclusive, o fato de podermos mudar o valor de `x` é o que caracteriza a ideia
  de variáveis: o valor delas **pode variar** durante o programa (se algum
  programador disser que o valor dela será alterado, como no caso de `x`).
