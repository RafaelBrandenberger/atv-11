Eu fiz umas mudanças no analisador para ele entender também os operadores de multiplicação (*), divisão (/), resto (%) e potência (^). No exemplo.flex, só adicionei esses símbolos para serem reconhecidos e transformados em tokens MULT, DIV, MOD e POW. Já no exemplo.cup, declarei esses novos terminais, organizei a ordem de precedência (com POW tendo a maior e associatividade à dirieta) e criei as regras pra que cada operação funcione.


1. Remover lixo se tiver: `rm -rf *.class *.java~ jcup.jar SQLParser.java sym.java jflex.jar SQLScanner.java`

2. `chmod +x executar.sh`

3. `./executar.sh`