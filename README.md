# WordNet-Toy
A proposta deste repositório é estudar o papel do Léxico no Processamento de Linguagem Natural (NLP), isso através da construção semiautomática de um glossário WordNet-Toy em português brasileiro com foco nos traços semânticos de relação de sentidos. Projeto feito para a disciplina 'Laboratório 6 - PLN' no curso de Linguística - UFSCar.

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

Em termos linguísticos, a WordNet é relevante pois apresenta um dicionário de consulta e de representação do conhecimento conceitual-lexical, além de permitir a geração de produtos lexicográficos. Em termos tecnológicos em NLP, a WordNet é relevante, por exemplo, para aplicações de desambiguação lexical de sentido, perguntas e respostas, resolução de anáfora e recuperação e extração de informações.

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

A delimitação do conhecimento a ser extraído inclui a categoria gramatical, a relação semântica de sinonímia e a relação semântica de hiponínima dos tokens selecionados. Para esse projeto, a unidade gramatical escolhida é a dos nomes (NOUN), contendo o intervalo de tamanho dessas unidades de unigrama para trigrama.

- Unigrama (1-grama) se trata de uma sequência de caracteres delimitada por espaços em branco - como 'casa' e 'sapato.
- Bigrama (2-grama) se trata de duas sequências de caracteres delimitadas por espaços em branco - como 'mesa lateral' e 'braço mecânico'.
- Trigrama (3-grama) se trata de três sequências de caracteres delimitadas por espaços em branco - como 'bola de futebol' e 'mesa de centro'.

A extração do conhecimento léxico-conceitual é realizada de modo semiautomático, utilizando diferentes métodos. Para a extração de unigramas, pode-se usar o parser UDPipe (portuguese-bosque-ud-2.10-220711), disponível online em: <https://lindat.mff.cuni.cz/services/udpipe/>. O motivo dessa escolha está no fato de que, para a detecção e extração de unigramas, são necessárias certas informações linguísticas, como categoria sintática e classe de palavra, que são apresentadas no tagging/parsing. O UD-Pipe, então, fornece as informações necessárias para a extração do conhecimento léxico-conceitual.

Para a extração dos bigramas e trigramas, pode-se usar o concordancer UDConcord (v1.0.0), disponível online em: <https://udconcord.icmc.usp.br>. O UDConcord funciona em termos de concordância sintática no processamento de dados linguísticos, fornecendo as informações necessárias para a extração de bigramas e trigramas a partir da concordância entre suas unidades lexicais.

No entanto, optei por fazer a extração dos dados linguísticos através da implementação de funções das bibliotecas UDPipe, ReadR e WriteXL, disponíveis para a linguagem R. A ideia foi de que, juntamente com a proposta de estudo, eu pratique um pouco da programação em R. De todo modo, as extrações foram feitas para unigramas, bigramas e trigramas.

A extração dos unigramas resultou em duas tabelas no formato .xlsx, uma contendo as informações de token, lema e classe gramatical, e a outra contendo as informações de lema e frequência de cada lema. Para a extração dos unigramas, bastou selecionar apenas os tokens que possuem a classe gramatical NOUN.

A extração dos bigramas e trigramas também resultou em duas tabelas no formato .xlsx, contendo as mesmas informações que as tabelas de unigramas. No entanto, para a extração dos bigramas, foi necessário buscar pela sequência de tokens de classe gramatical NOUN e ADJ, e, para a extração dos trigramas, pela sequência de tokens de classe gramatical NOUN ADP NOUN. A justificativa pela busca dessas sequências de classes gramaticais está no fato de que, no português brasileiro, essas são as estruturas mais produtivas de bigramas e trigramas.

## Fase representacional
Após a extração do conhecimento léxico-conceitual, entramos na fase representacional da construção da WordNet-Toy, que consiste na representação do conhecimento extraído para o formato WordNet, contendo etapas como:

- Identificação das sinonímias;
  
- Construção dos synsets;

- Construção das hierárquias de synsets.

Para identificar as sinonímias a partir do material tratado na fase linguística, é possível utilizar diferentes estratégias:

- Expressão Indicativa;

- Variação Linguística;

- Domínio de Conhecimento;

- Synsets Isolados.

As expressões indicativas são pistas linguísticas presentes no corpus que identificam sinônimos. Essas pistas são expressas como: outra palavra para, conhecido como, isto é, ou seja, ou, parênteses.

Por exemplo, para a expressão indicativa "ou", a ideia é que o termo que aparece lineramente antes dela é sinônimo do termo que aparece depois. (Hatchback ou hatch -> são sinônimos).

A estratégia que utiliza das variações linguísticas para identificar sinonímias se vale de diferentes tipos de variações:

- Variação Ortográfica (por grafia, como "porta malas" e "porta-malas");

- Variação Paradigmática (por paradigma lexical, como "assento" e "banco");

- Variação Sintática (por equivalência de estrutura sintática, como "exame de sangue" e "exame sanguíneo");

- Variação por Siglagem (por redução em siglas, como "educação à distância" e "EaD").

A estratégia de domínio de conhecimento considera informações epistêmicas sobre o mundo para a identificação de sinônimos. Por exemplo, a partir de nosso conhecimento de mundo, sabemos que "carroceria principal" e "cabine" são sinônimos.

Jã a estratégia de synsets isolados consiste em reunir as expressões linguísticas do corpus que não possuem sinônimos e, para cada uma delas, criar um synset próprio.

Após as estratégias usadas para encontrar sinonímias, colocamos as expressões e as estratégias em uma tabela e construímos synsets a partir dos resultados obtidos, como ilustrado na imagem a seguir:

![image](https://github.com/Lisanju/WordNet-Toy/assets/106002045/0b2f8ed4-bbe2-415c-913b-216e3687790d)

Os synsets são construídos com os sinônimos separados por vírgulas e endentados por chaves. -> { área, espaço, capacidade }

Com os synsets preparados, a próxima etapa da fase representacional é a construção das hierarquias de synsets. Para isso, é possível construir as hierarquias através de um método top-down ou bottom-up (sendo a diferença entre esses métodos a orientação em que a hierarquia é construída e como a informação contida nela é lida -> de cima para baixo ou de baixo para cima). Para este projeto, uso o método bottom-up.

As relações semânticas responsáveis pela construção das hierarquias de synsests são a hiponímia e a hiperonímia. Em termos simples, dizemos que um dado conjunto A é hiperônimo de um conjunto B caso A contenha B. E, por outro lado, um conjunto B é hipônimo de A caso B esteja contido em A.

Por exemplo, {carro} é hiperônimo de {hatchback}, assim como {hatchback} é hipônimo de {carro}.

A hierarquia, então, é construída a partir dessas relações semânticas. Os hiperônimos são colocados graficamente acima de seus hipônimos, até que a hierarquia alcance um hiperônimo que inclua todos os synsets extraídos. O hiperônimo que aparece no topo da hierarquia é o hiperônimo mais genérico, responsável por representar todas as entidades denotadas pelos synsets extraídos.

Por outro lado, os hipônimos que aparecem na base da hierarquias denotam conceitos mais específicos dentre os synsets coletados.

Para auxiliar na classificação de hiperônimos e hipônimos entre os synsets extraídos, uso o site WordNet Search (v3.1), disponível em: <http://wordnetweb.princeton.edu/perl/webwn>. Ele contém um banco de dados de hierarquias já montadas por outros linguistas.

Para manter a hierarquia construída a partir dos synsets salvas temporariamente, armazenei ela em uma planilha:

![image](https://github.com/Lisanju/WordNet-Toy/assets/106002045/3d948ba3-fad9-4cb3-8bf2-f42c6d24ecf9)

## Fase implementacional

Por fim, a fase implementacional consiste na codificação do conhecimento formalizado em uma base de dados (isto é, um objeto computacional).

Para codificar o conhecimento em uma base de dados, usei o editor de ontologias Web Protégé (v4.0.2), disponível em <https://webprotege.stanford.edu/>. A ontologia implementada no Protégé pode ser exportada nos formatos XML, OWL, Turtle, e RDF. Desse modo, o glossário conceitual WordNet-Toy construído pode ser utilizado como base de dados para diferentes tarefas computacionais envolvendo o processamento de linguagem natural.

![image](https://github.com/Lisanju/WordNet-Toy/assets/106002045/f0d70670-adc2-4c4c-bf4c-4b8eab51dbd2)
