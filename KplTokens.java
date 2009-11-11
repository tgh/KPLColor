/*
 * Copyright © 2009 Tyler Hayes
 * ALL RIGHTS RESERVED
 * [This program is licensed under the GPL version 3 or later.]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

public interface KplTokens {

    /* END OF INPUT */
    int ENDINPUT = 0;

    /* IDENTIFIER */
    int IDENTIFIER = 1;

    /* LITERALS */
    int CHAR_LITERAL = 2;
    int DOUBLE_LITERAL = 3;
    int INTEGER_LITERAL = 4;
    int STRING_LITERAL = 5;

    /* OPERATORS AND SEPARATORS */
    int SHIFT_LEFT = 6;               // <<
    int SHIFT_RIGHT_ARITHMETIC = 7;   // >>
    int SHIFT_RIGHT_LOGICAL = 8;      // >>>
    int CONDITIONAL_AND = 9;          // &&
    int CONDITIONAL_OR = 10;          // ||
    int CONDITIONAL_EQUAL = 11;       // ==
    int NOT_EQUAL = 12;               // !=
    int PLUS_EQUAL = 13;              // +=
    int MINUS_EQUAL = 14;             // -=
    int LESS_OR_EQUAL = 15;           // <=
    int GREATER_OR_EQUAL = 16;        // >=
    // '!' = 33
    // '%' = 37
    // '&' = 38
    // '(' = 40
    // ')' = 41
    // '*' = 42
    // '+' = 43
    // ',' = 44
    // '-' = 45
    // '.' = 46
    // '/' = 47
    // ':' = 58
    // '<' = 60
    // '=' = 61
    // '>' = 62
    // '^' = 94
    // '{' = 123
    // '|' = 124
    // '}' = 125
    // '[' = 133
    // ']' = 135

    /* KEYWORDS */
    int KEYWORD_ALLOC = 200; 
    int KEYWORD_ANYTYPE = 201;
    int KEYWORD_ARRAY = 202;
    int KEYWORD_ARRAYSIZE = 203;
    int KEYWORD_ASINTEGER = 204;
    int KEYWORD_ASPTRTO = 205;
    int KEYWORD_BEHAVIOR = 206;
    int KEYWORD_BOOL = 207;
    int KEYWORD_BREAK = 208;
    int KEYWORD_BY = 209;
    int KEYWORD_CASE = 210;
    int KEYWORD_CATCH = 211;
    int KEYWORD_CHAR = 212;
    int KEYWORD_CLASS = 213;
    int KEYWORD_CODE = 214;
    int KEYWORD_CONST = 215;
    int KEYWORD_CONTINUE = 216;
    int KEYWORD_DEBUG = 217;
    int KEYWORD_DEFAULT = 218;
    int KEYWORD_DO = 219;
    int KEYWORD_DOUBLE = 220;
    int KEYWORD_ELSE = 221;
    int KEYWORD_ELSEIF = 222;
    int KEYWORD_ENDBEHAVIOR = 223;
    int KEYWORD_ENDCLASS = 224;
    int KEYWORD_ENDCODE = 225;
    int KEYWORD_ENDFOR = 226;
    int KEYWORD_ENDFUNCTION = 227;
    int KEYWORD_ENDHEADER = 228;
    int KEYWORD_ENDIF = 229;
    int KEYWORD_ENDINTERFACE = 230;
    int KEYWORD_ENDMETHOD = 231;
    int KEYWORD_ENDPACKAGE = 232;
    int KEYWORD_ENDRECORD = 233;
    int KEYWORD_ENDSWITCH = 234;
    int KEYWORD_ENDTRY = 235;
    int KEYWORD_ENDWHILE = 236;
    int KEYWORD_ENUM = 237;
    int KEYWORD_ERRORS = 238;
    int KEYWORD_EXTENDS = 239;
    int KEYWORD_EXTERNAL = 240;
    int KEYWORD_FALSE = 241;
    int KEYWORD_FIELDS = 242;
    int KEYWORD_FOR = 243;
    int KEYWORD_FREE = 244;
    int KEYWORD_FUNCTION = 245;
    int KEYWORD_FUNCTIONS = 246;
    int KEYWORD_HEADER = 247;
    int KEYWORD_IF = 248;
    int KEYWORD_IMPLEMENTS = 249;
    int KEYWORD_INFIX = 250;
    int KEYWORD_INT = 251;
    int KEYWORD_INTERFACE = 252;
    int KEYWORD_ISINSTANCEOF = 253;
    int KEYWORD_ISKINDOF = 254;
    int KEYWORD_MESSAGES = 255;
    int KEYWORD_METHOD = 256;
    int KEYWORD_METHODS = 257;
    int KEYWORD_NEW = 258;
    int KEYWORD_NULL = 259;
    int KEYWORD_OF = 260;
    int KEYWORD_PACKAGE = 261;
    int KEYWORD_PREFIX = 262;
    int KEYWORD_PTR = 263;
    int KEYWORD_RECORD = 264;
    int KEYWORD_RENAMING = 265;
    int KEYWORD_RETURN = 266;
    int KEYWORD_RETURNS = 267;
    int KEYWORD_SELF = 268;
    int KEYWORD_SIZEOF = 269;
    int KEYWORD_SUPER = 270;
    int KEYWORD_SUPERCLASS = 271;
    int KEYWORD_SWITCH = 272;
    int KEYWORD_THROW = 273;
    int KEYWORD_TO = 274;
    int KEYWORD_TRUE = 275;
    int KEYWORD_TRY = 276;
    int KEYWORD_TYPE = 277;
    int KEYWORD_TYPEOFNULL = 278;
    int KEYWORD_UNTIL = 279;
    int KEYWORD_USES = 280;
    int KEYWORD_VAR = 281;
    int KEYWORD_VOID = 282;
    int KEYWORD_WHILE = 283;
}
