/*
 * Copyright © 2009 Tyler Hayes
 * ALL RIGHTS RESERVED
 * [This program is licensed under the GPL version 3 or later.]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/**
 * @author Tyler Hayes
 * 
 * Color highlighting for Kernel Programming Language (KPL) source code.  Output
 * in HTML.
 */

%%

%standalone
%public
%class KPLColorLexer
%extends Object
%implements KplTokens
%unicode
%int
%line
%function nextToken


InputChar = [^\n\r]
Newline = \n|\r|\r\n
IntegerLiteral = 0 | [1-9][0-9]*
HexLiteral = "0x"[0-9a-fA-F]+
Exponent = "e"{IntegerLiteral}
DecimalPoint = "."{IntegerLiteral}{Exponent}?
DoubleLiteral = {IntegerLiteral}{DecimalPoint}
TooManyDigits = [1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]+{DecimalPoint}?
IllegalNumber = [2-9][1-9][4-9][7-9][4-9][8-9][3-5][6-9][4-9][8-9]{DecimalPoint}?
Identifier = [a-zA-Z_][a-zA-Z0-9_]*
LineComment = "--"{InputChar}*{Newline}
BlockComment = "/\*"(.|{Newline})*"\*/"
Comments = {LineComment} | {BlockComment}
IllegalStrEscChar = "\\"[^n\\\"t\'0]

%{
	static {
		System.out.println("<html>");
		System.out.println("<head>");
		System.out.println("<title>KPL Highlighted Source Code</title>");
		System.out.println("<style type=\"text/css\">");
		System.out.println("  body     {white-space:pre;");
		System.out.println("            font-family:\'Courier New\', Courier, monospace;");
        System.out.println("            font-size:10pt}");
		System.out.println("  .keyword {color:maroon; font-weight:bold;}");
        System.out.println("  .type {color:darkorange; font-weight:bold;}");
        System.out.println("  .string {color:darkgreen}");
        System.out.println("  .char {color:purple; font-weight:bold;}");
		System.out.println("  .comment {color:blue; font-style:italic;}");
		System.out.println("  .number {color:red; font-weight:bold;}");
		System.out.println("  .invalid {color:deeppink}");
		System.out.println("</style>");
		System.out.println("</head>");
		System.out.println("<body>");
        System.out.print("1\t");
	}
%}

//lexer enters this state when a " is encountered
%state STRING

//lexer enters this state when a ' is encountered
%state CHAR

//lexer must return 0 when the end-of-file is reached of the lexer test
%eofval{
		System.out.println("</body>");
		System.out.println("</html>");

		return 0;
%eofval}

%%

<YYINITIAL> "alloc"     { System.out.print("<span class=\"keyword\">alloc</span>");
                          return KEYWORD_ALLOC; }
<YYINITIAL> "anyType"   { System.out.print("<span class=\"keyword\">anyType</span>");
                          return KEYWORD_ANYTYPE; }
<YYINITIAL> "array"     { System.out.print("<span class=\"type\">array</span>");
                          return KEYWORD_ARRAY; }
<YYINITIAL> "arraySize" { System.out.print("<span class=\"keyword\">arraySize</span>");
                          return KEYWORD_ARRAYSIZE; }
<YYINITIAL> "asInteger" { System.out.print("<span class=\"keyword\">asInteger</span>");
                          return KEYWORD_ASINTEGER; }
<YYINITIAL> "asPtrTo"   { System.out.print("<span class=\"keyword\">asPtrTo</span>");
                          return KEYWORD_ASPTRTO; }
<YYINITIAL> "behavior"  { System.out.print("<span class=\"keyword\">behavior</span>");
                          return KEYWORD_BEHAVIOR; }
<YYINITIAL> "bool"      { System.out.print("<span class=\"type\">bool</span>");
						  return KEYWORD_BOOL; }
<YYINITIAL> "break"     { System.out.print("<span class=\"keyword\">break</span>");
                          return KEYWORD_BREAK; }
<YYINITIAL> "by"        { System.out.print("<span class=\"keyword\">by</span>");
                          return KEYWORD_BY; }
<YYINITIAL> "case"      { System.out.print("<span class=\"keyword\">case</span>");
                          return KEYWORD_CASE; }
<YYINITIAL> "catch"     { System.out.print("<span class=\"keyword\">catch</span>");
                          return KEYWORD_CATCH; }
<YYINITIAL> "char"      { System.out.print("<span class=\"type\">char</span>");
                          return KEYWORD_CHAR; }
<YYINITIAL> "class"     { System.out.print("<span class=\"keyword\">class</span>");
						  return KEYWORD_CLASS; }
<YYINITIAL> "code"      { System.out.print("<span class=\"keyword\">code</span>");
                          return KEYWORD_CODE; }
<YYINITIAL> "const"     { System.out.print("<span class=\"type\">const</span>");
                          return KEYWORD_CONST; }
<YYINITIAL> "continue"  { System.out.print("<span class=\"keyword\">continue</span>");
                          return KEYWORD_CONTINUE; }
<YYINITIAL> "debug"     { System.out.print("<span class=\"keyword\">debug</span>");
                          return KEYWORD_DEBUG; }
<YYINITIAL> "default"   { System.out.print("<span class=\"keyword\">default</span>");
                          return KEYWORD_DEFAULT; }
<YYINITIAL> "do"        { System.out.print("<span class=\"keyword\">do</span>");
                          return KEYWORD_DO; }
<YYINITIAL> "double"    { System.out.print("<span class=\"type\">double</span>");
                          return KEYWORD_DOUBLE; }
<YYINITIAL> "else"      { System.out.print("<span class=\"keyword\">else</span>");
						  return KEYWORD_ELSE; }
<YYINITIAL> "elseIf"    { System.out.print("<span class=\"keyword\">elseIf</span>");
						  return KEYWORD_ELSEIF; }
<YYINITIAL> "endBehavior" { System.out.print("<span class=\"keyword\">endBehavior</span>");
						  return KEYWORD_ENDBEHAVIOR; }
<YYINITIAL> "endClass"  { System.out.print("<span class=\"keyword\">endClass</span>");
						  return KEYWORD_ENDCLASS; }
<YYINITIAL> "endCode"   { System.out.print("<span class=\"keyword\">endCode</span>");
						  return KEYWORD_ENDCODE; }
<YYINITIAL> "endFor"    { System.out.print("<span class=\"keyword\">endFor</span>");
						  return KEYWORD_ENDFOR; }
<YYINITIAL> "endFunction" { System.out.print("<span class=\"keyword\">endFunction</span>");
						  return KEYWORD_ENDFUNCTION; }
<YYINITIAL> "endHeader" { System.out.print("<span class=\"keyword\">endHeader</span>");
						  return KEYWORD_ENDHEADER; }
<YYINITIAL> "endIf"     { System.out.print("<span class=\"keyword\">endIf</span>");
						  return KEYWORD_ENDIF; }
<YYINITIAL> "endInterface" { System.out.print("<span class=\"keyword\">endInterface</span>");
						  return KEYWORD_ENDINTERFACE; }
<YYINITIAL> "endMethod" { System.out.print("<span class=\"keyword\">endMethod</span>");
						  return KEYWORD_ENDMETHOD; }
<YYINITIAL> "endRecord" { System.out.print("<span class=\"keyword\">endRecord</span>");
						  return KEYWORD_ENDRECORD; }
<YYINITIAL> "endSwitch" { System.out.print("<span class=\"keyword\">endSwitch</span>");
						  return KEYWORD_ENDSWITCH; }
<YYINITIAL> "endTry"    { System.out.print("<span class=\"keyword\">endTry</span>");
						  return KEYWORD_ENDTRY; }
<YYINITIAL> "endWhile"  { System.out.print("<span class=\"keyword\">endWhile</span>");
						  return KEYWORD_ENDWHILE; }
<YYINITIAL> "enum"      { System.out.print("<span class=\"type\">enum</span>");
						  return KEYWORD_ENUM; }
<YYINITIAL> "errors"    { System.out.print("<span class=\"keyword\">errors</span>");
						  return KEYWORD_ERRORS; }
<YYINITIAL> "extends"   { System.out.print("<span class=\"keyword\">extends</span>");
						  return KEYWORD_EXTENDS; }
<YYINITIAL> "external"  { System.out.print("<span class=\"keyword\">external</span>");
						  return KEYWORD_EXTERNAL; }
<YYINITIAL> "false"     { System.out.print("<span class=\"keyword\">false</span>");
						  return KEYWORD_FALSE; }
<YYINITIAL> "fields"    { System.out.print("<span class=\"keyword\">fields</span>");
						  return KEYWORD_FIELDS; }
<YYINITIAL> "for"       { System.out.print("<span class=\"keyword\">for</span>");
						  return KEYWORD_FOR; }
<YYINITIAL> "free"      { System.out.print("<span class=\"keyword\">free</span>");
						  return KEYWORD_FREE; }
<YYINITIAL> "function"  { System.out.print("<span class=\"keyword\">function</span>");
						  return KEYWORD_FUNCTION; }
<YYINITIAL> "functions"  { System.out.print("<span class=\"keyword\">functions</span>");
						  return KEYWORD_FUNCTIONS; }
<YYINITIAL> "header"    { System.out.print("<span class=\"keyword\">header</span>");
						  return KEYWORD_HEADER; }
<YYINITIAL> "if"        { System.out.print("<span class=\"keyword\">if</span>");
						  return KEYWORD_IF; }
<YYINITIAL> "implements" { System.out.print("<span class=\"keyword\">implements</span>");
						  return KEYWORD_IMPLEMENTS; }
<YYINITIAL> "infix"     { System.out.print("<span class=\"keyword\">infix</span>");
						  return KEYWORD_INFIX; }
<YYINITIAL> "int"       { System.out.print("<span class=\"type\">int</span>");
						  return KEYWORD_INT; }
<YYINITIAL> "interface" { System.out.print("<span class=\"keyword\">interface</span>");
						  return KEYWORD_INTERFACE; }
<YYINITIAL> "isInstanceOf" { System.out.print("<span class=\"keyword\">isInstanceOf</span>");
						  return KEYWORD_ISINSTANCEOF; }
<YYINITIAL> "isKindOf"  { System.out.print("<span class=\"keyword\">isKindOf</span>");
						  return KEYWORD_ISKINDOF; }
<YYINITIAL> "messages"  { System.out.print("<span class=\"keyword\">messages</span>");
						  return KEYWORD_MESSAGES; }
<YYINITIAL> "method"    { System.out.print("<span class=\"keyword\">method</span>");
						  return KEYWORD_METHOD; }
<YYINITIAL> "methods"   { System.out.print("<span class=\"keyword\">methods</span>");
						  return KEYWORD_METHODS; }
<YYINITIAL> "new"       { System.out.print("<span class=\"keyword\">new</span>");
						  return KEYWORD_NEW; }
<YYINITIAL> "null"      { System.out.print("<span class=\"keyword\">null</span>");
						  return KEYWORD_NULL; }
<YYINITIAL> "of"        { System.out.print("<span class=\"keyword\">of</span>");
						  return KEYWORD_OF; }
<YYINITIAL> "prefix"    { System.out.print("<span class=\"keyword\">prefix</span>");
						  return KEYWORD_PREFIX; }
<YYINITIAL> "ptr"       { System.out.print("<span class=\"keyword\">ptr</span>");
						  return KEYWORD_PTR; }
<YYINITIAL> "record"    { System.out.print("<span class=\"keyword\">record</span>");
						  return KEYWORD_RECORD; }
<YYINITIAL> "renaming"  { System.out.print("<span class=\"keyword\">renaming</span>");
						  return KEYWORD_RENAMING; }
<YYINITIAL> "return"    { System.out.print("<span class=\"keyword\">return</span>");
						  return KEYWORD_RETURN; }
<YYINITIAL> "returns"   { System.out.print("<span class=\"keyword\">returns</span>");
						  return KEYWORD_RETURNS; }
<YYINITIAL> "self"      { System.out.print("<span class=\"keyword\">self</span>");
						  return KEYWORD_SELF; }
<YYINITIAL> "sizeOf"    { System.out.print("<span class=\"keyword\">sizeOf</span>");
						  return KEYWORD_SIZEOF; }
<YYINITIAL> "super"     { System.out.print("<span class=\"keyword\">super</span>");
						  return KEYWORD_SUPER; }
<YYINITIAL> "superclass" { System.out.print("<span class=\"keyword\">superclass</span>");
						  return KEYWORD_SUPERCLASS; }
<YYINITIAL> "switch"    { System.out.print("<span class=\"keyword\">switch</span>");
						  return KEYWORD_SWITCH; }
<YYINITIAL> "throw"     { System.out.print("<span class=\"keyword\">throw</span>");
						  return KEYWORD_THROW; }
<YYINITIAL> "to"        { System.out.print("<span class=\"keyword\">to</span>");
						  return KEYWORD_TO; }
<YYINITIAL> "true"      { System.out.print("<span class=\"keyword\">true</span>");
						  return KEYWORD_TRUE; }
<YYINITIAL> "try"       { System.out.print("<span class=\"keyword\">try</span>");
						  return KEYWORD_TRY; }
<YYINITIAL> "type"      { System.out.print("<span class=\"keyword\">type</span>");
						  return KEYWORD_TYPE; }
<YYINITIAL> "typeOfNull" { System.out.print("<span class=\"keyword\">typeOfNull</span>");
						  return KEYWORD_TYPEOFNULL; }
<YYINITIAL> "until"     { System.out.print("<span class=\"keyword\">until</span>");
						  return KEYWORD_UNTIL; }
<YYINITIAL> "uses"      { System.out.print("<span class=\"keyword\">uses</span>");
						  return KEYWORD_USES; }
<YYINITIAL> "var"       { System.out.print("<span class=\"keyword\">var</span>");
						  return KEYWORD_VAR; }
<YYINITIAL> "void"      { System.out.print("<span class=\"type\">void</span>");
						  return KEYWORD_VOID; }
<YYINITIAL> "while"     { System.out.print("<span class=\"keyword\">while</span>");
						  return KEYWORD_WHILE; }

<YYINITIAL> {

	\"					{ yybegin (STRING);
                          System.out.print("<span class=\"string\">\""); }

    \'                  { yybegin (CHAR);
                          System.out.print("<span class=\"char\">\'"); }

    {Identifier}        { System.out.print(yytext());
    					  return IDENTIFIER; }
    					  
	{TooManyDigits}		{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }
						  
	{IllegalNumber}	    { System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

    {IntegerLiteral}    { System.out.print("<span class=\"number\">" + yytext() + "</span>");
    					  return INTEGER_LITERAL; }

    {HexLiteral}        { System.out.print("<span class=\"number\">" + yytext() + "</span>");
    					  return INTEGER_LITERAL; }

    {DoubleLiteral}    { System.out.print("<span class=\"number\">" + yytext() + "</span>");
    					  return DOUBLE_LITERAL; }

    ">"                 { System.out.print("&gt");
    					  return '>'; }
    ">="                { System.out.print("&gt=");
    					  return GREATER_OR_EQUAL; }
    "<"                 { System.out.print("&lt");
    					  return '<'; }
    "<="                { System.out.print("&lt=");
    					  return LESS_OR_EQUAL; }
    "&"                 { System.out.print("&amp");
    					  return '&'; }
    "&&"                { System.out.print("&amp&amp");
    					  return CONDITIONAL_AND; }

    {Comments}          { System.out.print("<span class=\"comment\">" + yytext() + "</span>");
                          System.out.print((yyline+2) + "\t"); }

    {Newline}           { System.out.print("\n" + (yyline+2) + "\t"); }
}

<STRING> {

	\"					{ yybegin (YYINITIAL);
                          System.out.print(yytext() + "</span>");
						  return STRING_LITERAL; }
	
	{IllegalStrEscChar}	{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }
						  
	{Newline}			{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }
	
}

<CHAR> {

    \'                  { yybegin (YYINITIAL);
                          System.out.print(yytext() + "</span>");
                          return CHAR_LITERAL; }

    [\\..+] | [^\\][.+] { System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

	{IllegalStrEscChar}	{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

	{Newline}			{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

}
