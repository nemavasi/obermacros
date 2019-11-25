MODULE Math;

IMPORT JS;

PROCEDURE ArcCos* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.acos(x)"); RETURN res
END ArcCos;

PROCEDURE ArcCosh* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.acosh(x)"); RETURN res
END ArcCosh;

PROCEDURE ArcSin* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.asin(x)"); RETURN res
END ArcSin;

PROCEDURE ArcSinh* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.asinh(x)"); RETURN res
END ArcSinh;

PROCEDURE ArcTan* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.atan(x)"); RETURN res
END ArcTan;

PROCEDURE ArcTan2* (y, x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.atan2(x)"); RETURN res
END ArcTan2;

PROCEDURE ArcTanh* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.atanh(x)"); RETURN res
END ArcTanh;

PROCEDURE Ceiling* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.ceil(x)"); RETURN res
END Ceiling;

PROCEDURE Cos* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.cos(x)"); RETURN res
END Cos;

PROCEDURE Cosh* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.cosh(x)"); RETURN res
END Cosh;

PROCEDURE Exp* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.exp(x)"); RETURN res
END Exp;

PROCEDURE Exponent* (x: REAL): INTEGER;
BEGIN
RETURN 0
END Exponent;

PROCEDURE Floor* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.floor(x)"); RETURN res
END Floor;

PROCEDURE Frac* (x: REAL): REAL;
BEGIN
RETURN 0.0
END Frac;

PROCEDURE IntPower* (x: REAL; n: INTEGER): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.pow(x, n)"); RETURN res
END IntPower;

PROCEDURE Log* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.log10(x)"); RETURN res
END Log;

PROCEDURE Ln* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.log(x)"); RETURN res
END Ln;

PROCEDURE Mantissa* (x: REAL): REAL;
BEGIN
RETURN 0.0
END Mantissa;

PROCEDURE Pi* (): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.PI"); RETURN res
END Pi;

PROCEDURE Power* (x, y: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.pow(x, y)"); RETURN res
END Power;

PROCEDURE Round* (x: REAL): REAL;
BEGIN
RETURN Floor(x + 0.5)
END Round;

PROCEDURE Sign* (x: REAL): REAL;
VAR res: REAL;
BEGIN
IF x > 0.0 THEN
res := 1.0
ELSIF x < 0.0 THEN
res := -1.0
ELSE
res := 0.0
END;
RETURN res
END Sign;

PROCEDURE Sin* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.sin(x)"); RETURN res
END Sin;

PROCEDURE Sinh* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.sinh(x)"); RETURN res
END Sinh;

PROCEDURE Sqrt* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.sqrt(x)"); RETURN res
END Sqrt;

PROCEDURE Tan* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.tan(x)"); RETURN res
END Tan;

PROCEDURE Tanh* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.tanh(x)"); RETURN res
END Tanh;

PROCEDURE Trunc* (x: REAL): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.trunc(x)"); RETURN res
END Trunc;

PROCEDURE Rnd*(): REAL;
VAR res: REAL;
BEGIN JS.do("res = Math.random()"); RETURN res
END Rnd;

END Math.

