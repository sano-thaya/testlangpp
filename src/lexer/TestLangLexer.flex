package lexer;

%%

%class TestLangLexer
%public
%unicode
%line
%column
%type int

%{

//helper method
private void token(String name){
    System.out.println(name + " at line " + (yyline + 1));
}

public static final int
    TEST = 1,
    GET = 2,
    POST = 3,
    PUT = 4,
    DELETE = 5,

    EXPECT = 6,
    STATUS = 7,
    BODY = 8,
    CONTAINS = 9,

    IDENT = 10,
    NUMBER = 11,
    STRING = 12,

    LBRACE = 13,
    RBRACE = 14,
    SEMICOLON = 15,
    EQUALS = 16;
%}

%%

// --------- WHITESPACE ----------
[ \t\r\n]+        { /* ignore */ }

// --------- COMMENTS ------------
"//".*            { /* ignore comment */ }

// --------- KEYWORDS ------------
"test"            { return TEST; }
"GET"             { return GET; }
"POST"            { return POST; }
"PUT"             { return PUT; }
"DELETE"          { return DELETE; }
"expect"          { return EXPECT; }
"status"          { return STATUS; }
"body"            { return BODY; }
"contains"        { return CONTAINS; }

// --------- SYMBOLS -------------
"{"               {  return LBRACE; }
"}"               { return RBRACE; }
";"               { return SEMICOLON; }
"="               { return EQUALS; }



// --------- ERROR ---------------
.                 {
                    System.err.println(
                      "Illegal character '" + yytext() +
                      "' at line " + (yyline + 1)
                    );
                  }