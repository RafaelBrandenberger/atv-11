import java_cup.runtime.Symbol;

%%

%cup
%unicode
%line
%column
%class MeuScanner

letra = [a-zA-Z]
digito = [0-9]
identificador = {letra}({letra}|{digito})*
numero = {digito}+

%%

SELECT      { return new Symbol(sym.SELECT); }
FROM        { return new Symbol(sym.FROM); }
WHERE       { return new Symbol(sym.WHERE); }
{identificador}  { return new Symbol(sym.ID, yytext()); }
{numero}     { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }
"="          { return new Symbol(sym.IGUAL); }
";"          { return new Symbol(sym.PTVIRG); }
[ \t\r\n]+   { /* ignora espaços e quebras de linha */ }
.            { System.err.println("Caractere inválido: " + yytext()); return null; }
