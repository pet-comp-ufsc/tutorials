(1) Como estudar programação?
=============================

Quando alguém decide ou precisa aprender a programar, provavelmente uma das
suas primeiras dúvidas é: "como aprender a programar?". No fundo, uma pergunta
difícil de responder, mas pode-se dar algumas sugestões. Seguem então algumas
ideias a respeito (siga aquelas que lhe servirem).

Pratique **e** leia
-------------------

Apenas escrever código é um erro. Apenas ler é um erro. Equilibre: leia a
respeito do que você irá programar (preferencialmente antes de tentar bater no
teclado programando no modo
[Go-Horse](https://pt.stackoverflow.com/q/164124/59974)). Tentar concluir as
coisas por conta própria através de tentativa e erro é altamente suscetível a
tirar conclusões extremamente erradas, por exemplo: não conhecer a ferramenta
que você usa e achar que ela é lenta para determinada coisa --- quando na
verdade é você que está usando da maneira errada ---, ou mesmo achar que
internamente o seu programa executa de uma maneira, quando na verdade é de
outra totalmente diferente. Leia, descubra, entenda: nada de conclusões
precipitadas!


Tenha um objetivo em mente
--------------------------

É bastante frequente que pessoas peguem uma linguagem qualquer (geralmente por
ver/ouvir a respeito dela em vários lugares) e tentem fazer programas genéricos
nela. De certa forma é válido, mas podemos otimizar esse aprendizado se
estabelecermos um objetivo. Ou seja, em vez de genericamente perguntar "como
aprender a programar?", podemos perguntar "o que eu quero fazer?". Por exemplo:

- Como posso criar um site, apenas pela curiosidade?
- Tenho ideia para um jogo, como posso programá-lo?
- Como converter uma planilha Excel para um formato específico?
- Como automatizar determinada coisa?

Essas perguntas são apenas chutes, mas geralmente quando se vai aprender a
programar, a pessoa tem algo que a motiva. Claro, nem sempre essa motivação é
algo tão específico (como um projeto pronto em mente), mas pode ser uma
curiosidade. Por exemplo, se o interesse da pessoa é saber a respeito de como
seu computador funciona, por exemplo, às vezes é interessante ter projetos
relacionados a:

- Microcontroladores; ou
- Otimização de código (aplicar efeitos em imagens, ou compressão de vídeo...);
  ou
- Gerenciamento explícito de memória (em C, por exemplo); etc...

Dessa forma podemos evitar o efeito "desânimo" causado por não ver objetivo no
que você está aprendendo. Alguém que quer aprender a fazer jogos provavelmente
não se sentirá motivada a aprender a programar CRUD's (_Create, Read, Update,
Delete_ --- são aqueles sistemas de gerenciamento cujas operações giram em
torno de "cadastrar usuário", "editar usuário", "listar usuários", "filtrar
usuários por tal critério", etc. ---), mas ficará bastante motivada de fazer o
seu primeiro [Pong](https://en.wikipedia.org/wiki/Pong). E por falar em Pong...


Mantenha a simplicidade
-----------------------

É interessante ter projetos em mente, objetivos bem claros, mas é também
interessante não tentar fazer um prédio porque você aprendeu a martelar um
prego.
Ou seja, se você adoraria criar o seu próprio GTA (exemplo obrigatório), é
bastante provável que partir direto para um jogo com todos os recursos e
jogabilidade de GTA seja um peso e responsabilidade exagerados para quem acabou
de começar. Em vez disso, você pode começar com algo mais simples, e
progressivamente dominar o que precisa para ter algo próximo do seu GTA.
Perceba o possível trajeto:

1. Começar com um Pong (humano vs humano) e entender como manipular imagens,
   FPS, botões, sons, etc.;

2. Incrementar o Pong com uma IA simples (para fazer um modo humano vs
   computador) e entender como fazer NPCs ativos;

3. Fazer um jogo simples de labirinto (2D visto de cima) em que o jogador deve
   levar seu personagem à saída, e com isso entender como implementar colisão
   com o cenário de forma mais eficiente;

Perceba que todos eles possuem um tempo de produção muito mais curto do que
partir direto para o tal GTA e trazem o suficiente para aprender algo que pode
ser utilizado depois. Outra possibilidade (caso tenha tempo) é pegar alguma
plataforma que permita fazer algo próximo do que deseja (no exemplo de Jogos,
um RPG Maker, Game Maker ou Unity).

Termine seus projetos
---------------------

Não há muito o que dizer, apenas termine seus projetos. Nada de "pausar eles
por tempo indeterminado": estabeleça como objetivo terminá-los **mesmo que não
da maneira mais perfeita que você gostaria**. Se seus projetos nunca são
terminados, procure formas de ser mais produtivo (o livro **"The Pragmatic
Programmer"**, de Andrew Hunt e David Thomas, é uma ótima pedida nesse quesito)
ou veja se você não está tentando montar prédios sabendo apenas martelar.

**Não esqueça: a sensação de terminar um projeto motiva MUITO.**


Seu Ctrl+C, Ctrl+V não funcionam, portanto escreva!
---------------------------------------------------

É uma prática bastante comum, no início (aos que perpetuam essa prática: vamos
lá, vocês podem dar mais de si), ficar ligeiramente perdido (ou tendo erros de
compilação sem conseguir perceber diferença alguma do seu código para o código
de exemplo) quanto a um tópico e então decidir copiar e colar códigos de
exemplo ou soluções da internet. Saiba que essa é uma **péssima** prática para
o seu aprendizado!

A solução para ela é bem simples: leia o código e escreva você mesmo, como um
Ctrl+C Ctrl+V manual. Sempre fique imaginando que esses atalhos não existem: se
você quiser copiar, precisa escrever caractere por caractere por conta própria.

Escrever em vez de copiar e colar te dá a grande vantagem de perceber os
detalhes e as construções da linguagem e abordagem que você está vendo.
Acredite, faz toda a diferença, inclusive porque uma hora você terá que
escrever código por conta própria, sem ter auxílio de fora, e se você não se
acostumou com as construções, começarão a surgir dúvidas como "primeiro vem ()
ou o nome? primeiro vem o nome do parâmetro ou o tipo? é & ou \*?".

Anote
-----

Quando estiver aprendendo algo novo (mesmo que seja a primeira coisa que você
estiver aprendendo), tenha consigo um bloco de anotações/caderno/o que for. Se
preferir anotar no computador/celular, você pode aproveitar ferramentas como
OneNote (Microsoft), GoogleKeep (ou Google Docs), que possuem esquemas de
organização de anotações bastante decente. E não sinta medo de escrever o que
entendeu para depois ler, encontrar erros, apagar e rabiscar: tudo isso conta,
e conta muito. Lembre-se: o que você anota é o que você pode rever, mas o que
você deixa apenas na sua cabeça não. Duvida? Diga o que você aprendeu em uma
data aleatória no ano passado (por exemplo, na semana do dia 20 de Maio).
Provavelmente não irá conseguir, mas se você estava estudando algo em Maio,
pode lembrar que anotou algo a respeito na semana do dia 20. Essas coisas nem
sempre pegam de uma semana para outra: às vezes você precisa revisar coisas que
viu há meses ou mesmo anos).


Recomendações de leitura
========================

1. [Quero programar, por onde começo?](https://medium.com/@robotlolita/quero-programar-por-onde-come%C3%A7o-43daeea807b2)
