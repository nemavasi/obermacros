MODULE Strings;

IMPORT JS;

PROCEDURE Len* (str: ARRAY OF CHAR): INTEGER;
VAR i: INTEGER;
BEGIN
i := 0; WHILE (i < LEN(str)) & (str[i] # 0X) DO INC(i) END;
RETURN i
END Len;

PROCEDURE Join* (VAR str1: ARRAY OF CHAR; str2: ARRAY OF CHAR);
VAR l1, l2, i: INTEGER;
BEGIN
l1 := Len(str1); l2 := Len(str2);
ASSERT(l2 < LEN(str1) - l1);
i := 0;
WHILE i < l2 DO str1[l1 + i] := str2[i]; INC(i) END
END Join;

PROCEDURE RealToString* (arg: REAL; VAR res: ARRAY OF CHAR; fixed: INTEGER);
VAR i, j, len: INTEGER; string1: ARRAY 64 OF CHAR;
BEGIN
JS.do("string1 = String(arg.toFixed(fixed));");
i := 0; j := 0;
len := LEN(string1);
IF string1[j] # "-" THEN res[i] := " "; INC(i); INC(len) END;
WHILE i < len DO
          IF string1[j] = "." THEN
res[i] := "."
ELSE
res[i] := string1[j]
END;
INC(i); INC(j);
END;
WHILE i < LEN(res) DO res[i] := 0X; INC(i) END
END RealToString;

PROCEDURE IntToString* (arg: INTEGER; VAR res: ARRAY OF CHAR);
VAR i: INTEGER; string1: ARRAY 64 OF CHAR;
BEGIN
JS.do("string1 = String(arg);");
i := 0;
WHILE i < LEN(string1) DO res[i] := string1[i]; INC(i) END;
WHILE i < LEN(res) DO res[i] := 0X; INC(i) END
END IntToString;

END Strings.