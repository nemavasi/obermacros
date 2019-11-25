MODULE Log;

IMPORT JS, Strings;

PROCEDURE Clear*;
BEGIN
JS.do("document.getElementById('log').innerHTML = ''")
END Clear;

PROCEDURE String*(arg: ARRAY OF CHAR);
BEGIN
JS.do("document.getElementById('log').innerHTML = document.getElementById('log').innerHTML + arg.toString().replace(/ /g,'&nbsp;')")
END String;

PROCEDURE Char*(arg: CHAR);
BEGIN
JS.do("document.getElementById('log').innerHTML = document.getElementById('log').innerHTML + JS.String.fromCharCode(arg)")
END Char;

PROCEDURE Real*(arg: REAL);
BEGIN
JS.do("document.getElementById('log').innerHTML = document.getElementById('log').innerHTML + arg")
END Real;

PROCEDURE RealForm* (x: REAL; fixed: INTEGER);
VAR str: ARRAY 256 OF CHAR;
BEGIN
Strings.RealToString(x, str, fixed);
String(str);
END RealForm;

PROCEDURE Int*(arg: INTEGER);
BEGIN
JS.do("document.getElementById('log').innerHTML = document.getElementById('log').innerHTML + arg")
END Int;

PROCEDURE Set*(s: SET);
VAR i: INTEGER; first: BOOLEAN;
BEGIN
first := TRUE;
String("{");
FOR i := 0 TO 31 DO
IF i IN s THEN
IF ~ first THEN String(",") END;
Int(i);
first := FALSE
END
END;
String("}")
END Set;

PROCEDURE Bool*(arg: BOOLEAN);
BEGIN
IF arg THEN String("TRUE") ELSE String("FALSE") END
END Bool;

PROCEDURE Ln*;
BEGIN
JS.do("document.getElementById('log').innerHTML = document.getElementById('log').innerHTML + '<br>'")
END Ln;

END Log.
