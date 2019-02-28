Sistema de Versionamento Git
============================

Sobre
-----

Este não é um tutorial para você **aprender** Git. Caso seu objetivo seja
aprender, siga o [Git Book](https://git-scm.com/book/en/v2) (não se assuste com
o tamanho dele: leia com carinho e atenção, é um livro muito bom que irá
ensiná-lo a utilizar Git corretamente).

Para que este tutorial então? Para servir de consulta rápida dos comandos do
Git, tendo pequenos exemplos e pequenas descrições do que você possivelmente
quer fazer.

Comandos básicos
----------------

Inicializar uma pasta como repositório Git:

```bash
git init
```

Checar o estado atual das alterações do repositório:

```bash
git status
```

Adicionar um espelho remoto:

```bash
git remote add nome link
```

Atualizar repositório local a partir do remoto:

```bash
git pull
```

Atualizar repositório remoto a partir do local:

```bash
git push nome-do-remoto branch-remoto
```

Relacionar _branch_ atual com um _branch_ remoto (para atualizar com `git
push`/`git pull` sem precisar especificar o remoto e _branch_):

```bash
git push --set-upstream nome-do-remoto branch-remoto
```

Adicionar alterações de um arquivo ao próximo _commit_ (_OBS: também
utilizado para indicar que foi removido_):

```bash
git add arquivo1 arquivo2 ...
```

Criar _commit_ com as alterações adicionadas:

```bash
git commit -m "Mensagem do commit"
```

Identificar autor dos commits apenas no repositório atual:

```bash
git config user.name "Nome do autor"
git config user.email "E-mail do autor"
```

Identificar autor dos commits para todos os repositórios do usuário logado no
computador:

```bash
git config --global user.name "Nome do autor"
git config --global user.email "E-mail do autor"
```

Exemplos
--------

### Inicializar repositório a partir do zero

Sendo "~/" a pasta do usuário atual:

```bash
~/ $ mkdir example
~/ $ cd example
~/example $ git init
Initialized empty Git repository in /home/user/example
~/example $ git remote add origin https://github.com/pet-comp-ufsc/git-example
~/example $ git push --set-upstream origin master
```

### Inicializar repositório a partir de um remoto

#### Método 1

Para quando:
- Você não tem o projeto localmente; e
- Você quer que o nome da pasta seja o mesmo do repositório.

```bash
~/ $ git clone https://github.com/pet-comp-ufsc/git-example
~/ $ cd git-example
~/git-example $
```

#### Método 2

Para quando:
- Você não tem o projeto localmente; e
- Você quer dar um nome específico para a pasta do projeto.

```bash
~/ $ git clone https://github.com/pet-comp-ufsc/git-example example
~/ $ cd example
~/example $
```

Para quando:
- Você **tem** o projeto localmente; e
- Você quer relacioná-lo ao remoto.

```bash
~/ $ cd example
~/example $ git init
Initialized empty Git repository in /home/user/example
~/example $ git remote add origin https://github.com/pet-comp-ufsc/git-example
~/example $ git pull origin master
```
