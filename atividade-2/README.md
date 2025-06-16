Eu transformei o analisador de expressões aritméticas em um analisador básico de JSON. No exemplo.flex, tirei tudo que era de operadores e inteiros, e coloquei as regras pra reconhecer os símbolos do JSON como chaves, colchetes, strings, números, true, false, null, etc. Também troquei o nome do scanner pra JSONScanner.

No exemplo.cup, mudei os terminais pra representar os elementos do JSON e reescrevi todas as regras pra aceitar objetos, arrays, strings, números e os literais. Usei Object[] e uns casts pra lidar com os pares e listas, e também troquei o nome do parser pra JSONParser.

E no Compilador.java, eu atualizei os nomes do scanner e parser, e ajustei a leitura do arquivo pra funcionar com arquivos JSON que vêm em várias linhas.


1. Remover lixo se tiver: `rm -rf *.class *.java~ jcup.jar SQLParser.java sym.java jflex.jar SQLScanner.java`

2. `chmod +x executar.sh`

3. `./executar.sh`