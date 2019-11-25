MODULE Draw;

IMPORT JS;

CONST
black* = 000000000H;
white* = 0FFFFFFFFH;
red*   = 0FFFF4444H;
green* = 0FF44FF44H;
blue*  = 0FF4444FFH;

TYPE
ProcessingType* = POINTER TO RECORD END; (* dummy type *)
CallbackType* = PROCEDURE;
Image* = POINTER TO RECORD END;

VAR
mouseX*, mouseY*: REAL;
width*, height*: INTEGER;
SetupProc, DrawProc, PressedProc, ReleasedProc, OverProc, OutProc: CallbackType;
Instance, myFont: ProcessingType;
started, focus*: BOOLEAN;

PROCEDURE CreateCanvas*(target: ARRAY OF CHAR);
BEGIN
JS.do("var canvas = document.createElement('canvas');
canvas.id = 'processingCanvas';
document.getElementById(target).innerHTML = '';
document.getElementById(target).appendChild(canvas);
");
END CreateCanvas;

(* callbacks *)

PROCEDURE SetSetupProc*(s : CallbackType);
BEGIN SetupProc := s
END SetSetupProc;

PROCEDURE SetDrawProc*(d : CallbackType);
BEGIN DrawProc := d
END SetDrawProc;

PROCEDURE SetPressedProc*(c : CallbackType);
BEGIN PressedProc := c
END SetPressedProc;

PROCEDURE SetReleasedProc*(c : CallbackType);
BEGIN ReleasedProc := c
END SetReleasedProc;

PROCEDURE SetOutProc*(c : CallbackType);
BEGIN OutProc := c
END SetOutProc;

PROCEDURE SetOverProc*(c : CallbackType);
BEGIN OverProc := c
END SetOverProc;

(* global *)

PROCEDURE SetFrameRate* (fps : INTEGER);
BEGIN JS.do("Instance.frameRate(fps);")
END SetFrameRate;

PROCEDURE SetBackground*(argb : INTEGER);
BEGIN JS.do("Instance.background(argb)")
END SetBackground;

PROCEDURE SetSize*(w, h : INTEGER);
BEGIN JS.do("Instance.size(w,h);")
END SetSize;

PROCEDURE Fill*(argb : INTEGER);
BEGIN JS.do("Instance.fill(argb)")
END Fill;

PROCEDURE NoFill*;
BEGIN JS.do("Instance.noFill()")
END NoFill;

PROCEDURE Stroke*(argb : INTEGER);
BEGIN JS.do("Instance.stroke(argb)")
END Stroke;

PROCEDURE NoStroke*;
BEGIN JS.do("Instance.noStroke()")
END NoStroke;

PROCEDURE StrokeWidth*(width : INTEGER);
BEGIN JS.do("Instance.strokeWeight(width)")
END StrokeWidth;

PROCEDURE Smooth*;
BEGIN JS.do("Instance.smooth()")
END Smooth;

PROCEDURE NoSmooth*;
BEGIN JS.do("Instance.noSmooth()")
END NoSmooth;

(* loop *)

PROCEDURE NoLoop*;
BEGIN JS.do("Instance.noLoop()")
END NoLoop;

PROCEDURE Loop*;
BEGIN JS.do("Instance.loop()")
END Loop;

PROCEDURE Redraw*;
BEGIN JS.do("Instance.redraw()")
END Redraw;

(* drawing *)

PROCEDURE Line*(x0, y0, x1, y1: REAL);
BEGIN JS.do("Instance.line(x0,y0,x1,y1)")
END Line;

PROCEDURE Ellipse*(x, y, w, h: REAL);
BEGIN JS.do("Instance.ellipse(x,y,w,h)")
END Ellipse;

PROCEDURE Rect*(x, y, w, h: REAL);
BEGIN JS.do("Instance.rect(x,y,w,h)")
END Rect;

PROCEDURE RectRounded*(x, y, w, h, r: REAL);
BEGIN JS.do("Instance.rect(x,y,w,h,r)")
END RectRounded;

(* drawing with int args *)

PROCEDURE Linei*(x0, y0, x1, y1: INTEGER);
BEGIN JS.do("Instance.line(x0,y0,x1,y1);")
END Linei;

PROCEDURE Ellipsei*(x, y, w, h: INTEGER);
BEGIN JS.do("Instance.ellipse(x,y,w,h);")
END Ellipsei;

PROCEDURE Recti*(x, y, w, h: INTEGER);
BEGIN JS.do("Instance.rect(x,y,w,h);")
END Recti;

PROCEDURE RectRoundedi*(x, y, w, h, r: INTEGER);
BEGIN JS.do("Instance.rect(x,y,w,h,r);")
END RectRoundedi;

(* math *)

PROCEDURE Radians*(angle : REAL): REAL;
VAR ret: REAL;
BEGIN
JS.do("ret = Instance.radians(angle)");
RETURN ret
END Radians;

(* text *)

PROCEDURE SetFont* (name: ARRAY OF CHAR);
BEGIN JS.do("myFont = Instance.loadFont(name)")
END SetFont;

PROCEDURE String*(mystr: ARRAY OF CHAR; x, y: REAL; size: INTEGER);
VAR i: INTEGER;
BEGIN
i := 0; WHILE (i < LEN(mystr)) & (mystr[i] # 0X) DO INC(i) END;
JS.do("Instance.textFont(myFont); Instance.textSize(size); var newStr = mystr.toString().substring(0, i); Instance.text(newStr, x, y)")
END String;

PROCEDURE Stringi*(mystr: ARRAY OF CHAR; x, y, size: INTEGER);
VAR i: INTEGER;
BEGIN
 i := 0; WHILE (i < LEN(mystr)) & (mystr[i] # 0X) DO INC(i) END;
        JS.do("Instance.textFont(myFont); Instance.textSize(size); var newStr = mystr.toString().substring(0, i); Instance.text(newStr, x, y)")
END Stringi;

(* image *)

PROCEDURE LoadImage* (name: ARRAY OF CHAR): Image;
VAR image: Image;
BEGIN
 JS.do("image = Instance.loadImage(name)")
 RETURN image
END LoadImage;

PROCEDURE PlaceImage* (image: Image; x, y: REAL);
BEGIN JS.do("Instance.image(image, x, y)")
END PlaceImage;

(* transform *)

PROCEDURE Translate*(x,y : REAL);
BEGIN JS.do("Instance.translate(x,y)")
END Translate;

PROCEDURE PushMatrix*;
BEGIN JS.do("Instance.pushMatrix()")
END PushMatrix;

PROCEDURE PopMatrix*;
BEGIN JS.do("Instance.popMatrix()")
END PopMatrix;

PROCEDURE Rotate*(angle : REAL);
BEGIN JS.do("Instance.rotate(angle)")
END Rotate;

(* internal engine *)

PROCEDURE InnerDraw;
BEGIN
IF DrawProc # NIL THEN
JS.do("mouseX = Instance.mouseX; mouseY = Instance.mouseY;
width = Instance.width; height = Instance.height;");
  DrawProc
 END
END InnerDraw;

PROCEDURE InnerSetup;
BEGIN IF SetupProc # NIL THEN SetupProc END
END InnerSetup;

PROCEDURE InnerPressed;
BEGIN IF PressedProc # NIL THEN PressedProc END
END InnerPressed;

PROCEDURE InnerReleased;
BEGIN IF ReleasedProc # NIL THEN ReleasedProc END
END InnerReleased;

PROCEDURE InnerOver;
BEGIN focus := TRUE; IF OverProc # NIL THEN OverProc END
END InnerOver;

PROCEDURE InnerOut;
BEGIN focus := FALSE; IF OutProc # NIL THEN OutProc END
END InnerOut;

(* start routine *)

PROCEDURE Start*;
BEGIN
 ASSERT(~started);
 JS.do("function sketchProc(p){p.draw=InnerDraw; p.setup=InnerSetup; p.mousePressed=InnerPressed; p.mouseReleased=InnerReleased; p.mouseOver=InnerOver; p.mouseOut=InnerOut; Instance=p;}");
 JS.do("var canvas = document.getElementById('processingCanvas');");
 JS.do("var processingInstance = new JS.Processing(canvas, sketchProc)");
 SetFont("Arial");
 focus := FALSE;
 started := TRUE
END Start;

END Draw.

