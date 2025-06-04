/* Definição: seção para código do usuário. */
import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{inteiro} {
    Integer numero = Integer.valueOf(yytext());
    return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
}
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULT); }      // Suporte à multiplicação
"/"       { return new Symbol(sym.DIV); }       // Suporte à divisão
"%"       { return new Symbol(sym.RESTO); }     // Suporte ao resto da divisão
"^"       { return new Symbol(sym.POT); }       // Suporte à potenciação
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espaços. */ }
.         { System.err.println("\nCaractere inválido: " + yytext() +
                              "\nLinha: " + yyline +
                              "\nColuna: " + yycolumn + "\n"); 
            return null; 
          }