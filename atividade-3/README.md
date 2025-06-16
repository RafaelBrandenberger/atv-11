Eu usei JFlex e JCup para criar um analisador com comandos SQL do tipo SELECT. O scanner (exemplo.flex) reconhece palavras-chave como SELECT, FROM, WHERE, identificadores e números. O parser (exemplo.cup) interpreta esses tokens e imprime os elementos da consulta (campo, tabela e filtro). 

Eu também criei um arquivo Compilador.java para ler os comandos de um .txt e processar um por um. 

1. Remover lixo se tiver: `rm -rf *.class *.java~ jcup.jar SQLParser.java sym.java jflex.jar SQLScanner.java`

2. `chmod +x executar.sh`

3. `./executar.sh`