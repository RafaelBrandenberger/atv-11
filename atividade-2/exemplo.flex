/* Definição: seção para código do usuário. */
import java_cup.runtime.Symbol;

%%

/* Opções e Declarações */
%cup
%unicode
%line
%column
%class JSONScanner

// Macros
DIGITO = [0-9]
NUMERO = -?{DIGITO}+(\.{DIGITO}+)?
ESCAPE = \\([\"\\/bfnrt]|u[0-9a-fA-F]{4})
CHAR = [^\"\\\n\r]
STRING = \"({CHAR}|{ESCAPE})*\"

%%

{NUMERO} {
    return new Symbol(sym.NUMBER, yyline, yycolumn, Double.valueOf(yytext()));
}
{STRING} {
    String s = yytext().substring(1, yytext().length()-1);
    return new Symbol(sym.STRING, yyline, yycolumn, s);
}
"true"     { return new Symbol(sym.TRUE); }
"false"    { return new Symbol(sym.FALSE); }
"null"     { return new Symbol(sym.NULL); }
"{"        { return new Symbol(sym.LBRACE); }
"}"        { return new Symbol(sym.RBRACE); }
"["        { return new Symbol(sym.LBRACKET); }
"]"        { return new Symbol(sym.RBRACKET); }
":"        { return new Symbol(sym.COLON); }
","        { return new Symbol(sym.COMMA); }
[ \t\r\n]+ { /* ignora espaços/brancos */ }
.          { System.err.println("Caractere inválido: " + yytext() + " Linha: " + yyline + " Coluna: " + yycolumn); return null; }