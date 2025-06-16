import java.io.*;

public class Compilador {
    public void compilar(String caminhoDoArquivoDeEntrada) throws Exception {
        FileReader fr = new FileReader(caminhoDoArquivoDeEntrada);
        BufferedReader br = new BufferedReader(fr);
        String linha;

        while ((linha = br.readLine()) != null) {
            if (linha.trim().isEmpty()) continue;
            System.out.println("> " + linha);
            processar(linha);
        }

        br.close();
        fr.close();
    }

    public void processar(String linha) {
        StringReader sr = new StringReader(linha + "\n");
        MeuParser parser = new MeuParser(new MeuScanner(sr));

        try {
            parser.parse();
        } catch (Exception e) {
            System.err.println("Erro ao processar linha: " + e.getMessage());
        }
    }
}
