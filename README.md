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

Uma bike é uma bicicleta - Verdadeiro.

Uma bicicleta é uma bike - Verdadeiro.

As expressões bike e bicicleta são sinônimas e, portanto, compõem o mesmo synset.

