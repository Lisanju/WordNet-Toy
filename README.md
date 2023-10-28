# WordNet-Toy
A proposta deste repositório é estudar o papel do Léxico no Processamento de Linguagem Natural (NLP), isso através da construção semiautomática de um glossário WordNet-Toy em português brasileiro com foco nos traços semânticos de relação de sentidos.

## O Léxico
Todo sistema de NLP precisa de um Léxico, pois ele fornece informações de diferentes naturezas linguísticas:

- Informações fonético-fonológicas, como fonemas e tonicidade;

- Informações morfológicas, como raízes, radicais e afixos;

- Informações sintáticas, como classe de palavras e subcategorização;

- Informações semânticas, como traços semânticos, restrições selecionais e relações de sentido;

- Informações pragmático-discursivas, como registros e funções retóricas.

Para o presente projeto, desenvolvo um Léxico semântico através de informações sobre relações de sentido. Esse processo será feito de modo semiautomático, através do uso de corpora e ferramentas de extração e manipulação de informações textuais.

## WordNet de Princeton
A WordNet de Princeton começou a ser desenvolvida em meados de 1980 no Laboratório de Ciência Cognitiva da Universidade de Priceton por um grupo coordenado pelo psicólogo George Miller, sendo atualmente coordenado pela linguista Christiane Fellbaum. O objetivo dessa WordNet é desenvolver um recurso lexical de base psicolinguística e psicolexicográfica, seguindo uma organização conceitual (e não alfabética) e em função do significado (e não da forma ou expressão linguística). O Thesaurus e Dicionários Onomasiológicos são exemplos de bases lexicais que seguem também essa organização.

A WordNet é, essencialmente, composta por:

- Estruturas sintáticas, como N, V, Adj e Adv;

- Conjunto de sinônimos (synsets).

Os synsets são construídos a partir da relação de sentido semântico de sinonímia. Por definição, uma expressão linguística é sinônima de outra caso a alteração de uma por outra num mesmo contexto linguístico não altera o valor de verdade da sentença. Por exemplo:

'Uma bike é uma bicicleta' - Verdadeiro.

'Uma bicicleta é uma bike' - Verdadeiro.

As expressões bike e bicicleta são sinônimas e, portanto, compõem um mesmo synset.

Há diferentes relações de sentido que um synset pode estabelecer com outro, como antonímia, hiponímia, meronímia, acarretamento, troponímia e causa. Para os interesses deste projeto, utilizo apenas as relações de sinonímia (para estabelecer os synsets) e de hiponímia (para subordinação e superordenação de synsets).

Em termos semânticos, uma expressão A é hipônima de B se e somente se A está contido em B e B não está contido em A. Por exemplo:

'Um carro é um tipo de veículo' - Verdadeiro.

'Um veículo é um tipo de carro' - Falso.

Carro está contido no conjunto de veículos, mas o contrário não é verdadeiro. Neste caso, dizemos que carro é hipônimo de veículo e que veículo é hiperônimo de carro.

A WordNet de Princeton pode ser acessada através do seguinte link: <https://wordnet.princeton.edu>. No site, para cada palavra há informações como glosa (definição informal do conceito expresso pelo synset), frases-exemplo (co-texto do item lexical de um synset) e frequência de ocorrência (para organização dos synsets).

Em termos linguísticos, a WordNet é relevante pois apresenta um dicionário relevante de consulta e de representação do conhecimento conceitual-lexical, além de permitir a geração de produtos lexicográficos. Em termos tecnológicos em NLP, a WordNet é relevante, por exemplo, para aplicações de desambiguação lexical de sentido, perguntas e respostas, resolução de anáfora e recuperação e extração de informações.

## Desambiguação Lexical de Sentido (WSD)
A desambiguação lexical de sentido (WSD, do inglês Word Sense Disambiguation), é um processo em NLP que, diante um texto de input sob análise, identifica o sentido correto de uma palavra polissêmica.

Imagine que em um texto os tokens 'bass' e 'organ' ocorrem e são identificados como NOUN pela sua estrutura sintática. A aplicação de WSD consulta a WordNet e busca pelos synsets NOUN em que esses tokens aparecem. No caso, o token 'organ' aparece em 6 synsets e 'bass' em 8 synsets. A aplicação WSD, então, recupera a hierarquia de todos os synsets que os tokens 'organ' e 'bass' aparecem. Depois disso, ela cruza todas as hierarquias de synsets e busca por similaridades entre elas, como representado a seguir:

- token 'organ': {entity} <- {physical entity} <- {object, physical object} <- {whole, unit} <- {artifact, artefact} <- {instumentality, instrumentation} <- **{musical instrument, instrument}** <- {electronic instrument, electronic musical instrument} <- {electric organ, electronic organ, Hammond organ, organ}

- token 'bass': {entity} <- {physical entity} <- {object, physical object} <- {whole, unit} <- {artifact, artefact} <- {instumentality, instrumentation} <- **{musical instrument, instrument}** <- {bass}

Entre as diferentes hierarquias de synsets, a aplicação WSD selecionou as duas hierarquias acima, visto que em ambas é identificado o sentido de instrumento musical, sendo, portanto, as hierarquias mais prováveis de estarem corretas para a desambiguação de sentido lexical dos tokens 'bass' e 'organ' que ocorrem num mesmo texto.

# Metodologia para a construção da WordNet-Toy

## Fase linguística
A fase linguística na construção de uma WordNet consiste no levantamento de estratégias humanas de sumarização de texto, incluindo etapas como:

- Seleção do tipo de fonte;

- Tratamento da fonte;

- Delimitação do conhecimento a extrair;

- Extração do conhecimento léxico-conceitual.

Para a seleção do tipo de fonte, há dois tipos possíveis, que são as fontes estruturadas e as fontes não-estruturadas. As fontes estruturadas incluem dicionários impressos ou digitais e databases ou wordnets, enquanto as fontes não-estruturadas incluem corpora. Para este projeto, utilizo uma fonte não-estruturada, valendo-me de um corpora selecionado.

O corpora selecionado é um texto único retirado do site do Consulado Geral do Japão em São Paulo, disponível em: <https://www.sp.br.emb-japan.go.jp/itprtop_pt/index.html>. O tratamento da fonte também é realizado manualmente, apesar de existirem ferramentas que automatizam o processo de tratamento de texto.

A delimitação do conhecimento a ser extraído inclui a categoria gramatical, a relação semântica de sinonímia e a relação semântica de hiponínima dos tokens selecionados. Para esse projeto, a unidade de categoria escolhida é a dos nomes (NOUN), contendo o intervalo de tamanho dessas unidades de unigrama para trigrama.

Unigrama (1-grama) se trata de uma sequência de caracteres delimitada por espaços em branco - como 'casa' e 'sapato.
Bigrama (2-grama) se trata de duas sequências de caracteres delimitadas por espaços em branco - como 'mesa lateral' e 'braço mecânico'.
Trigrama (3-grama) se trata de três sequências de caracteres delimitadas por espaços em branco - como 'bola de futebol' e 'mesa de centro'.

