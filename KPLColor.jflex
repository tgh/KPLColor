/*
 * Copyright © 2009 Tyler Hayes <tgh@pdx.edu>
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
%class KPLColor
%extends Object
%unicode
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
// BlockComment = "/\*"(.|{Newline})*"\*/"
// Comments = {LineComment} | {BlockComment}
IllegalStrEscChar = "\\"[^n\\\"t\'0]
LegalStrEscChar = "\\"[n\\\"t\'0]

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
        System.out.println("  .escape {color:limegreen}");
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

//lexer enters this state when /* is encountered
%state BLOCK_COMMENT

//lexer must return 0 when the end-of-file is reached of the lexer test
%eofval{
		System.out.println("</body>");
		System.out.println("</html>");

		return 0;
%eofval}

%%

<YYINITIAL> "alloc"     { System.out.print("<span class=\"keyword\">alloc</span>"); }
<YYINITIAL> "anyType"   { System.out.print("<span class=\"keyword\">anyType</span>"); }
<YYINITIAL> "array"     { System.out.print("<span class=\"type\">array</span>"); }
<YYINITIAL> "arraySize" { System.out.print("<span class=\"keyword\">arraySize</span>"); }
<YYINITIAL> "asInteger" { System.out.print("<span class=\"keyword\">asInteger</span>"); }
<YYINITIAL> "asPtrTo"   { System.out.print("<span class=\"keyword\">asPtrTo</span>"); }
<YYINITIAL> "behavior"  { System.out.print("<span class=\"keyword\">behavior</span>"); }
<YYINITIAL> "bool"      { System.out.print("<span class=\"type\">bool</span>"); }
<YYINITIAL> "break"     { System.out.print("<span class=\"keyword\">break</span>"); }
<YYINITIAL> "by"        { System.out.print("<span class=\"keyword\">by</span>"); }
<YYINITIAL> "case"      { System.out.print("<span class=\"keyword\">case</span>"); }
<YYINITIAL> "catch"     { System.out.print("<span class=\"keyword\">catch</span>"); }
<YYINITIAL> "char"      { System.out.print("<span class=\"type\">char</span>"); }
<YYINITIAL> "class"     { System.out.print("<span class=\"keyword\">class</span>"); }
<YYINITIAL> "code"      { System.out.print("<span class=\"keyword\">code</span>"); }
<YYINITIAL> "const"     { System.out.print("<span class=\"type\">const</span>"); }
<YYINITIAL> "continue"  { System.out.print("<span class=\"keyword\">continue</span>"); }
<YYINITIAL> "debug"     { System.out.print("<span class=\"keyword\">debug</span>"); }
<YYINITIAL> "default"   { System.out.print("<span class=\"keyword\">default</span>"); }
<YYINITIAL> "do"        { System.out.print("<span class=\"keyword\">do</span>"); }
<YYINITIAL> "double"    { System.out.print("<span class=\"type\">double</span>"); }
<YYINITIAL> "else"      { System.out.print("<span class=\"keyword\">else</span>"); }
<YYINITIAL> "elseIf"    { System.out.print("<span class=\"keyword\">elseIf</span>"); }
<YYINITIAL> "endBehavior" { System.out.print("<span class=\"keyword\">endBehavior</span>"); }
<YYINITIAL> "endClass"  { System.out.print("<span class=\"keyword\">endClass</span>"); }
<YYINITIAL> "endCode"   { System.out.print("<span class=\"keyword\">endCode</span>"); }
<YYINITIAL> "endFor"    { System.out.print("<span class=\"keyword\">endFor</span>"); }
<YYINITIAL> "endFunction" { System.out.print("<span class=\"keyword\">endFunction</span>"); }
<YYINITIAL> "endHeader" { System.out.print("<span class=\"keyword\">endHeader</span>"); }
<YYINITIAL> "endIf"     { System.out.print("<span class=\"keyword\">endIf</span>"); }
<YYINITIAL> "endInterface" { System.out.print("<span class=\"keyword\">endInterface</span>"); }
<YYINITIAL> "endMethod" { System.out.print("<span class=\"keyword\">endMethod</span>"); }
<YYINITIAL> "endRecord" { System.out.print("<span class=\"keyword\">endRecord</span>"); }
<YYINITIAL> "endSwitch" { System.out.print("<span class=\"keyword\">endSwitch</span>"); }
<YYINITIAL> "endTry"    { System.out.print("<span class=\"keyword\">endTry</span>"); }
<YYINITIAL> "endWhile"  { System.out.print("<span class=\"keyword\">endWhile</span>"); }
<YYINITIAL> "enum"      { System.out.print("<span class=\"type\">enum</span>"); }
<YYINITIAL> "errors"    { System.out.print("<span class=\"keyword\">errors</span>"); }
<YYINITIAL> "extends"   { System.out.print("<span class=\"keyword\">extends</span>"); }
<YYINITIAL> "external"  { System.out.print("<span class=\"keyword\">external</span>"); }
<YYINITIAL> "false"     { System.out.print("<span class=\"keyword\">false</span>"); }
<YYINITIAL> "fields"    { System.out.print("<span class=\"keyword\">fields</span>"); }
<YYINITIAL> "for"       { System.out.print("<span class=\"keyword\">for</span>"); }
<YYINITIAL> "free"      { System.out.print("<span class=\"keyword\">free</span>"); }
<YYINITIAL> "function"  { System.out.print("<span class=\"keyword\">function</span>"); }
<YYINITIAL> "functions"  { System.out.print("<span class=\"keyword\">functions</span>"); }
<YYINITIAL> "header"    { System.out.print("<span class=\"keyword\">header</span>"); }
<YYINITIAL> "if"        { System.out.print("<span class=\"keyword\">if</span>"); }
<YYINITIAL> "implements" { System.out.print("<span class=\"keyword\">implements</span>"); }
<YYINITIAL> "infix"     { System.out.print("<span class=\"keyword\">infix</span>"); }
<YYINITIAL> "int"       { System.out.print("<span class=\"type\">int</span>"); }
<YYINITIAL> "interface" { System.out.print("<span class=\"keyword\">interface</span>"); }
<YYINITIAL> "isInstanceOf" { System.out.print("<span class=\"keyword\">isInstanceOf</span>"); }
<YYINITIAL> "isKindOf"  { System.out.print("<span class=\"keyword\">isKindOf</span>"); }
<YYINITIAL> "messages"  { System.out.print("<span class=\"keyword\">messages</span>"); }
<YYINITIAL> "method"    { System.out.print("<span class=\"keyword\">method</span>"); }
<YYINITIAL> "methods"   { System.out.print("<span class=\"keyword\">methods</span>"); }
<YYINITIAL> "new"       { System.out.print("<span class=\"keyword\">new</span>"); }
<YYINITIAL> "null"      { System.out.print("<span class=\"keyword\">null</span>"); }
<YYINITIAL> "of"        { System.out.print("<span class=\"keyword\">of</span>"); }
<YYINITIAL> "prefix"    { System.out.print("<span class=\"keyword\">prefix</span>"); }
<YYINITIAL> "ptr"       { System.out.print("<span class=\"keyword\">ptr</span>"); }
<YYINITIAL> "record"    { System.out.print("<span class=\"keyword\">record</span>"); }
<YYINITIAL> "renaming"  { System.out.print("<span class=\"keyword\">renaming</span>"); }
<YYINITIAL> "return"    { System.out.print("<span class=\"keyword\">return</span>"); }
<YYINITIAL> "returns"   { System.out.print("<span class=\"keyword\">returns</span>"); }
<YYINITIAL> "self"      { System.out.print("<span class=\"keyword\">self</span>"); }
<YYINITIAL> "sizeOf"    { System.out.print("<span class=\"keyword\">sizeOf</span>"); }
<YYINITIAL> "super"     { System.out.print("<span class=\"keyword\">super</span>"); }
<YYINITIAL> "superclass" { System.out.print("<span class=\"keyword\">superclass</span>"); }
<YYINITIAL> "switch"    { System.out.print("<span class=\"keyword\">switch</span>"); }
<YYINITIAL> "throw"     { System.out.print("<span class=\"keyword\">throw</span>"); }
<YYINITIAL> "to"        { System.out.print("<span class=\"keyword\">to</span>"); }
<YYINITIAL> "true"      { System.out.print("<span class=\"keyword\">true</span>"); }
<YYINITIAL> "try"       { System.out.print("<span class=\"keyword\">try</span>"); }
<YYINITIAL> "type"      { System.out.print("<span class=\"keyword\">type</span>"); }
<YYINITIAL> "typeOfNull" { System.out.print("<span class=\"keyword\">typeOfNull</span>"); }
<YYINITIAL> "until"     { System.out.print("<span class=\"keyword\">until</span>"); }
<YYINITIAL> "uses"      { System.out.print("<span class=\"keyword\">uses</span>"); }
<YYINITIAL> "var"       { System.out.print("<span class=\"keyword\">var</span>"); }
<YYINITIAL> "void"      { System.out.print("<span class=\"type\">void</span>"); }
<YYINITIAL> "while"     { System.out.print("<span class=\"keyword\">while</span>"); }

<YYINITIAL> {

	\"					{ yybegin (STRING);
                          System.out.print("<span class=\"string\">\""); }

    \'                  { yybegin (CHAR);
                          System.out.print("<span class=\"char\">\'"); }

    "/*"                { yybegin (BLOCK_COMMENT);
                          System.out.print("<span class=\"comment\">/*"); }

    {Identifier}        { System.out.print(yytext()); }
    					  
	{TooManyDigits}		{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }
						  
	{IllegalNumber}	    { System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

    {IntegerLiteral}    { System.out.print("<span class=\"number\">" + yytext() + "</span>"); }

    {HexLiteral}        { System.out.print("<span class=\"number\">" + yytext() + "</span>"); }

    {DoubleLiteral}    { System.out.print("<span class=\"number\">" + yytext() + "</span>"); }

    ">"                 { System.out.print("&gt"); }
    ">="                { System.out.print("&gt="); }
    "<"                 { System.out.print("&lt"); }
    "<="                { System.out.print("&lt="); }
    "&"                 { System.out.print("&amp"); }
    "&&"                { System.out.print("&amp&amp"); }

    {LineComment}       { System.out.print("<span class=\"comment\">" + yytext() + "</span>");
                          System.out.print((yyline+2) + "\t"); }

    {Newline}           { System.out.print("\n" + (yyline+2) + "\t"); }
}

<STRING> {

	\"					{ yybegin (YYINITIAL);
                          System.out.print(yytext() + "</span>"); }
	
    {LegalStrEscChar}   { System.out.print("<span class=\"escape\">" + yytext() + "</span>"); }

	{IllegalStrEscChar}	{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }
						  
	{Newline}			{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }
	
}

<CHAR> {

    \'                  { yybegin (YYINITIAL);
                          System.out.print(yytext() + "</span>"); }

    [\\..+] | [^\\][.+] { System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

	{IllegalStrEscChar}	{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

	{Newline}			{ System.out.print("<span class=\"invalid\">" + yytext() + "</span>"); }

}

<BLOCK_COMMENT> {

    "*/"                { yybegin (YYINITIAL);
                          System.out.print(yytext() + "</span>"); }

    {Newline}           { System.out.print("</span>\n" + (yyline+2) + "\t<span class=\"comment\">"); }

}
