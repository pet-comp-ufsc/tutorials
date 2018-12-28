Sistema de Versionamento Git
============================

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

Identificar autor dos commits para todos os repositórios do usuário logado no computador:

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

Método 1:

```bash
~/ $ git clone https://github.com/pet-comp-ufsc/git-example
~/ $ cd git-example
~/git-example $
```

Método 2:

```bash
~/ $ git clone https://github.com/pet-comp-ufsc/git-example example
~/ $ cd example
~/example $
```

Método 3:

```bash
~/ $ mkdir example
~/ $ cd example
~/example $ git init
Initialized empty Git repository in /home/user/example
~/example $ git remote add origin https://github.com/pet-comp-ufsc/git-example
~/example $ git pull origin master
```