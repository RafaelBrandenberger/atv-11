import java.io.*;

public class Compilador {
    public void compilar(String caminhoDoArquivoDeEntrada) throws Exception {
        FileReader fileReader = null;
        BufferedReader bufferedReader = null;

        try {
            fileReader = new java.io.FileReader(caminhoDoArquivoDeEntrada);
            bufferedReader = new BufferedReader(fileReader);
            StringBuilder conteudo = new StringBuilder();
            String linha;
            while ((linha = bufferedReader.readLine()) != null) {
                conteudo.append(linha).append("\n");
            }
            processar(conteudo.toString());
        } catch (IOException e) {
            System.err.println("Erro ao ler arquivo de entrada: " + e.getMessage());
        } finally {
            if (bufferedReader != null)
                bufferedReader.close();
            if (fileReader != null)
                fileReader.close();
        }
    }

    public void processar(String conteudo) {
        StringReader stringReader = new StringReader(conteudo);
        JSONParser parser = new JSONParser(new JSONScanner(stringReader));
        try {
            parser.parse();
        } catch (Exception e) {
            System.err.println("Erro na expressão: " + e.getMessage());
        } finally {
            stringReader.close();
        }
    }
}