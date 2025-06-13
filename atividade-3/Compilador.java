import java.io.*;

public class Compilador {
    public void compilar(String arquivoEntrada) throws Exception {
        FileReader fileReader = new FileReader(arquivoEntrada);
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        String linha;
        while ((linha = bufferedReader.readLine()) != null) {
            if (linha.trim().isEmpty()) continue;
            System.out.println("> " + linha);
            processar(linha);
        }
        bufferedReader.close();
        fileReader.close();
    }

    public void processar(String linha) throws Exception {
        StringReader stringReader = new StringReader(linha + "\n");
        SQLParser parser = new SQLParser(new SQLScanner(stringReader));
        try {
            parser.parse();
        } catch (Exception e) {
            System.err.println("Erro na expressão: " + e.getMessage());
        }
        stringReader.close();
    }
}