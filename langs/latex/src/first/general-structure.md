Estrutura geral e classes
=========================

Arquivos LaTeX são organizados, em resumo, da seguinte forma:

1. Classe do documento
2. Preâmbulo (próximo tópico)
3. Documento

Na **classe do documento** se define justamente que tipo de documento se trata.
As classes principais são:
- `article`: Apesar do nome, serve para documentos no geral (o que inclui
  também artigos científicos).
- `book`: Para livros;
- `beamer`: Para apresentações de slides.

Há várias outras classes que podem ser interessantes, dependendo do tipo de
documento. Você pode checar algumas delas [na introdução a LaTeX do
Overleaf](https://www.overleaf.com/learn/latex/Creating_a_document_in_LaTeX#Reference_guide).

No **documento** fica o conteúdo do seu documento: todos os capítulos,
parágrafos, tabelas, imagens, etc. Ao longo deste capítulo serão vistos vários
comandos que podem ser utilizados nele.

Comandos e ambientes
--------------------

Você irá perceber que LaTeX é composto majoritariamente de comandos e
ambientes.

<concept title="Comandos">
Assim como _macros_, são precedidos por `\`. Comandos podem alterar a
formatação de um texto, inserir elementos (como imagens, conteúdos de outros
arquivos), e efetuar operações (como alterar a linguagem do texto, por
exemplo).
</concept>

Por exemplo, `\textbf{<texto>}` é o comando para deixar um texto em negrito:

```latex
\textbf{Este trecho está em negrito.}
Já este outro trecho não.
```

O que irá gerar algo como:

>**Este trecho está em negrito.**
>Já este outro não.

**Ambientes** são como comandos, porém para blocos de código em vez de pequenos
textos. O seu documento, por exemplo, é definido no ambiente `document`, como
você verá na parte prática. Ambientes podem ser utilizados com:

```latex
\begin{<ambiente>}
    <conteúdo>
\end{<ambiente>}
```

Prática
-------

Esboce seu primeiro documento seguindo os passos:
1. Escolha uma das classes de sua vontade;
2. Crie um arquivo de texto (em branco) chamado `main.tex` (o nome pode ser
   qualquer um, na verdade, mas para fins de nos entendermos por aqui, o
   chamarei de `main.tex`);
3. Nesse arquivo, escreva `\documentclass{<classe>}`, trocando `<classe>` pela
   classe de documento escolhida. Por exemplo, para a `article`, seu documento
   será:

   ```latex
   \documentclass{article}
   ```

4. Escreva alguma frase para o conteúdo do seu documento. O conteúdo do seu
   documento deve ficar entre uma linha contendo `\begin{document}` e outra
   contendo `\end{document}`. Por exemplo:

   ```latex
   \begin{document}
       Texto de exemplo
   \end{document}
   ```

   Se você estiver utilizando `beamer`, cada slide deve estar em um ambiente
   `frame`, portanto o código deve ser:

   ```latex
   \begin{document}
       \begin{frame}
           Texto de exemplo.
       \end{frame}
   \end{document}
   ```

   Você pode ainda aproveitar e colocar um título para esse `frame`, da forma:


   ```latex
   \begin{document}
       \begin{frame}{Primeiro Frame}
           Texto de exemplo.
       \end{frame}
   \end{document}
   ```

5. Utilize seu compilador para gerar o PDF a partir do `main.tex`, por exemplo:

   ```console
   $ xelatex main.tex
   ```

Tendo feito esses 5 passos, você agora terá um arquivo `main.pdf`. Abaixo
seguem tanto o código final de exemplo quanto os PDFs gerados quando utilizando
`article` e `beamer`.

### Com `article`

```latex
\documentclass{article}

\begin{document}
    Texto de exemplo
\end{document}
```

![Exemplo 1 compilado com Article](./img/example-article-1.png)

### Com `beamer`

```latex
\documentclass{beamer}

\begin{document}
    \begin{frame}{Primeiro Frame}
        Texto de exemplo
    \end{frame}
\end{document}
```

![Exemplo 1 compilado com Beamer](./img/example-beamer-1.png)
