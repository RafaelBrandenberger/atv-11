/* Seção de código do usuário */
import java_cup.runtime.Symbol;

%%

/* Opções e Declarações */
%cup
%unicode
%line
%column
%class SQLScanner

// Macros
letra = [a-zA-Z_]
digito = [0-9]
identificador = {letra}({letra}|{digito})*
numero = {digito}+

%%

/* Regras léxicas */
"SELECT"        { return new Symbol(sym.SELECT); }
"FROM"          { return new Symbol(sym.FROM); }
"WHERE"         { return new Symbol(sym.WHERE); }
","             { return new Symbol(sym.VIRGULA); }
"="             { return new Symbol(sym.IGUAL); }
";"             { return new Symbol(sym.PTVIRG); }

{identificador} { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }
{numero}        { return new Symbol(sym.NUM, yyline, yycolumn, Integer.valueOf(yytext())); }

[ \t\r\n]+      { /* ignora espaços e quebras */ }

.               { System.err.println("Caractere inválido: " + yytext()); return null; }