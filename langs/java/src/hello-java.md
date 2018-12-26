"Hello, Java!"
==============

Primeiro programa em Java
-------------------------

### Exemplo direto

_(Obs: antes de seguir, certifique-se de que você possui a JDK instalada e que
a pasta dela está configurada na variável de ambiente "path" - veja como fazer
isso na [Ferramenta 1](#ferramentas))_

Primeiramente vamos dar uma olhada em um simples código em Java:

```java
public class HelloWorld {
    public static void main(String... args) {
        System.out.println("Hello, world!");
    }
}
```

Esse primeiro exemplo, salvo num arquivo "HelloWorld.java", faz nada mais nada
menos do que mostrar um texto ("Hello, world!") na tela. Uma maneira de rodá-lo
é [compilando](01-java-and-langs.md) com o comando `javac` e então executando
com o comando `java`:

_(Obs: "~/dev/java" é a pasta em que o terminal está trabalhando - e onde o
código acima foi salvo -; o "$" é meramente para separar o que são os comandos
(à direita do $) e o que são outras informações (à esquerda do $))_

_(Obs2: `ls` é o comando para mostrar o conteúdo da pasta em que o terminal
está trabalhando)_

```
~/dev/java $ ls
HelloWorld.java

~/dev/java $ javac HelloWorld.java
~/dev/java $ java HelloWorld
Hello, world!
~/dev/java $
```

Caso prefira rodar de outra maneira, cheque a seção de
[Ferramentas](./tools.md) como executar na sua ferramenta favorita. Mas,
enquanto acompanha os tutoriais, é recomendado manter-se no compilador sozinho.
Utilize outra ferramenta apenas se não conseguir seguir pelo compilador no
terminal/CMD do Windows.
