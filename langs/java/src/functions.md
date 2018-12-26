Criando seus próprios comandos
==============================

Na maioria dos casos em programação imperativa, criar seus próprios comandos
significa criar sua própria **função**. Funções são trechos de código que podem
ser executados eventualmente. Geralmente se pode executar esses trechos
utilizando o identificador dessa função.

Funções são também ótimas para se ter **reuso** e **legibilidade**, palavras
que você irá ouvir bastante enquanto programador.

Funções fazem com que tenhamos apenas um lugar para consertar um erro quando
ele existir. Por exemplo: imagine que você fez um código que pede a senha para
o usuário, mas percebe que esqueceu de não mostrar a senha na tela.  Se o mesmo
código estiver espalhado pelo programa, ele terá que ser consertado em cada um
dos lugares. Porém, se em vez disso tivermos uma função `askPassword`, teremos
que corrigir apenas um único lugar (que é na implementação dessa função), e
então todo lugar que a chamar já estará consertado.
