Criar e estruturar projetos em Python
=====================================

Uma dúvida bastante comum aos iniciantes em Python é: como exatamente se
deveria estruturar projetos em Python? Podemos pensar em coisas como:
- Como isolar o que é utilizado em um projeto do resto do sistema (para
  garantir que se sabe o que exatamente interfere nele ou não);
- Como garantir que um projeto vá rodar conforme esperado em diferentes
  máquinas ou formas de executar;
- Como organizar as pastas e arquivos do projeto de maneira razoável.

**Poetry** é uma ferramenta que irá praticamente resolver os dois primeiros
pontos e irá dar uma ideia sobre o terceiro. Em resumo, Poetry é um
**gerenciador de dependências e empacotador** de Python e, no momento, não há
um bom motivo para não utilizá-lo em qualquer projeto que vá ser criado. Para
instalá-lo, siga o [tutorial de instalação de
Poetry](https://python-poetry.org/docs/#installation).

<warn title="Recomendações">
  <b>OBS:</b> Recomenda-se fortemente configurar o Poetry para gerar
  <i>virtualenvs</i> na pasta do projeto, executando:<br>
  <code class="language-console hljs shell">
$ poetry config virtualenvs.in-project true
  </code>
  <br>Isso evita que polua a sua pasta do usuário com <i>virtualenvs</i>, criando elas nas
  pastas dos projetos em vez disso e facilitando integração com ferramentas como
  VSCode (que buscam por <i>virtualenvs</i> na pasta do projeto).
</warn>

Criando um projeto
------------------

Poetry, de brinde, nos dá um comando para criar um projeto novo já com uma
estrutura pronta:

```console
$ poetry new poetry-demo
```

Isso irá gerar uma pasta `poetry-demo` com o seguinte conteúdo:

```console
poetry-demo
├── pyproject.toml
├── README.md
├── poetry_demo
│   └── __init__.py
└── tests
    ├── __init__.py
    └── test_poetry_demo.py
```

Na seção seguinte ficará mais claro o papel de cada um desses itens.

Estruturando um projeto
-----------------------

A estrutura de projeto gerada pelo `poetry` é já uma base interessante, pois
há:
- Um arquivo indicando as informações do projeto e suas dependências e que pode
  ser utilizado por uma ferramenta pronta e funcional (`pyproject.toml`).
- Um arquivo com informações gerais sobre o projeto, instruções de instalação,
  uso e contribuição, e por aí vai (`README.md`).
- Uma pasta contendo códigos para testes, que irão garantir que quem realizar
  mudanças no projeto não será avisado quando elas quebrarem o comportamento
  esperado do programa (por exemplo, se você sem querer fizer que uma função
  `square(x)` não devolva o valor correto para alguns valores de `x`).
- Um **pacote** com o código fonte do projeto (`poetry_demo`), que será
  importado por outras bibliotecas/aplicações ou executado pelo usuário.

Essa é uma estrutura mínima e saudável de projeto que você pode seguir sem
medo. A ressalva fica em relação ao pacote do projeto (neste exemplo, a pasta
`poetry_demo`), que pode ser alterado para um **módulo** em vez de um pacote.

<concept title="Módulo">
Um <a href="https://docs.python.org/pt-br/3/tutorial/modules.html">módulo</a>,
em Python, é um arquivo contendo definições e instruções. Um arquivo
<code>foo.py</code> é dito como o módulo <code>foo</code>.
<br>
Um exemplo de módulo pode ser um arquivo <code>geometry.py</code> que contenha:
<br>
<pre>
<code class="language-python hljs">
from dataclasses import dataclass
<br>
@dataclass
class Rectangle:
  x: int
  y: int
  width: int
  height: int
<br>
def area(rect: Rectangle) -> int:
  return rect.width * rect.height
  </code>
</pre>
Nesse caso, o módulo <code>geometry</code> fornece a definição de uma classe
<code>Rectangle</code> e uma função <code>area</code>.
</concept>

Se um projeto consiste de um código que vá ser razoável de se manter em apenas
um único arquivo, então ele pode ser mantido em um único módulo na raíz do
projeto. Sendo direto, no exemplo do `poetry-demo`, seria, em vez de se ter uma
pasta `poetry_demo` com um arquivo `__init__.py`, ter apenas um arquivo
`poetry_demo.py`:

```console
poetry-demo
├── pyproject.toml
├── README.md
├── poetry_demo.py
└── tests
    ├── __init__.py
    └── test_poetry_demo.py
```

Se o projeto precisar de mais módulos, então fará mais sentido organizá-lo
direto da forma que Poetry gera, ou seja, com um **pacote**.

<concept title="Pacote">
Um <a
href="https://docs.python.org/pt-br/3/tutorial/modules.html#packages">pacote</a>,
em Python, é uma forma de organizar o escopo de módulos no
<code>pacote.modulo</code> (ou <code>pacote.subpacote.modulo</code>, quando o
pacote possui um subpacote).
</concept>

Por exemplo, quando há em um código Python:

```python
import libone.foo
import libtwo.foo
```

Nele, na primeira linha, `foo` é um módulo que pertence ao pacote `libone`,
enquanto na segunda linha temos _outro_ módulo `foo`, porém dessa vez do pacote
`libtwo`. São dois módulos diferentes, de pacotes diferentes, porém com mesmo
nome.
