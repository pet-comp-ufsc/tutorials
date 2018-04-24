JDK
===


Índice
------

1. [Sobre](#sobre)
2. [Instalação](#instalação)
   1. [Windows](#windows)
   2. [Linux](#linux)
       1. [Ubuntu](#ubuntu)
       2. [ArchLinux](#archlinux)
3. [Como utilizar](#como-utilizar)
   1. [Compilar](#compilar)
   2. [Executar um código compilado](#executar-um-código-compilado)
   3. [Alterar para onde vão os arquivos .class](#alterar-para-onde-vão-os-arquivos-.class)



Sobre
-----

O [JDK](http://www.oracle.com/technetwork/java/javase/overview/index.html)
(_Java Development Kit_) é um conjunto de programas para desenvolvedores
poderem compilar, depurar e analisar códigos escritos em Java. Trata-se das
ferramentas oficiais da linguagem para desenvolvimento, atualmente desenvolvida
pela Oracle.


Instalação
----------

### Informações gerais

**Versão sugerida**: OpenJDK-10 (mais recente)

### Windows

1. Siga para a [página de download oficial da
   Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
   e clique no botão "Download" com o ícone de Java 10.

2. Na seção cinza com o título "Java SE Development Kit _<Versão>_", marque
   "**Accept License Agreement**";

3. Clique no link de download para Windows (que termina em ".exe).

4. Execute o arquivo baixado.

5. [Teste](#como-utilizar) se a ferramenta está no PATH.

### Linux

#### Ubuntu

Siga as instruções [nesta
resposta](https://stackoverflow.com/a/14788468/3326309), porém considere a
versão sugerida acima no lugar.

#### ArchLinux

Execute o comando:

```
pacman -S jdk10-openjdk
```


Como utilizar
-------------

### Compilar

_(OBS: Se as classes que você irá compilar estão em um `package`, veja o
tutorial [Como trabalhar com pacotes](/langs/java/xx-packages.md) para saber
como compilá-los da maneira correta)_

#### Windows:

Para compilar um arquivo de código Java:

1. Abra um `cmd` na pasta em que se encontra o arquivo de código. Isso pode ser
   feito de duas formas:

   1. (Windows 8 e 10) Abrindo a pasta pelo Windows Explorer, indo em "Arquivo"
      e "Abrir prompt de comando aqui";
   2. Abrindo um `cmd` (tecle `Windows+R`, digite "cmd" e dê um Enter) e
      inserindo o comando:

      ```bat
      > cd "Pasta em que está o arquivo"
      ```

      **Exemplo**: se o arquivo está na pasta "Testes com Java" em "Documentos":

      ```bat
      > cd "Documentos/Testes com Java"
      ```

      **Exemplo 2**: se o arquivo está em um **pendrive** na unidade "E:", na
      pasta "E:/dev/java":

      ```bat
      > E:
      > cd dev/java
      ```
2. Execute o comando `javac <nome do arquivo>.java`:

   **Exemplo**: se o arquivo se chama "HelloWorld.java":

   ```bat
   > javac HelloWorld.java
   ```

#### Linux:

Para compilar um arquivo de código Java, execute:

```bash
$ cd "pasta/em/que/está/o/arquivo/de/código"
$ javac NomeDoArquivo.java
```

**Exemplo**: se o arquivo "HelloWorld.java" está na pasta "~/dev/java/learn/":

```bash
$ cd ~/dev/java/learn
$ javac HelloWorld.java
```

### Executar um código compilado

Primeiramente, é necessário ter o JRE instalado. Os passos de instalação são os
mesmos que o do JDK, porém trocando "JRE" por "JDK" (exceto na instalação para
Ubuntu).

Apenas vá até a pasta em que se encontra o código e execute:

```bash
$ java NomeDaClasseComOMain
```

**Exemplo**: Se o arquivo compilado foi "HelloWorld.java", ele terá gerado um
"HelloWorld.class", sendo assim, basta executar:

```bash
$ java HelloWorld
```

Se a classe se encontra em um `package`, é necessário ir até a pasta **antes**
do pacote e executar `java pacote.Classe`.

**Exemplo**: Supondo a estrutura de pastas:

```
`- myproject
   `- src
      `- mypackage
         `- MyClass.java
```

Teríamos que ir até a pasta "myproject/src" e executar:

```bash
$ javac mypackage/MyClass.java
```

Isso irá criar um arquivo "MyClass.class" dentro de "mypackage" (caso queira,
veja como [Alterar para onde vão os arquivos
.class](#alterar-para-onde-vão-os-arquivos-.class)):

```
`- myproject
   `- src
      `- mypackage
         |- MyClass.class
         `- MyClass.java
```

Sendo assim, bastaria executar:

```bash
$ java mypackage.MyClass
```

### Alterar para onde vão os arquivos .class

_**(TODO)**_

