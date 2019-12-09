(* used code from Daniel Shiffman https://processing.org/examples/mandelbrot.html *)

MODULE Init;

IMPORT Log, D := Draw, Math, JS;

VAR

  width, w, height, h, xmin, ymin, xmax, ymax, dx, dy, y, x, a, b, absOld, max, aa, bb, abs, diffToLast, diffToMax, twoab : REAL;
  maxiterations, j, i, n, convergeNumber, norm : INTEGER;
  break : BOOLEAN;

PROCEDURE Map(value, istart, istop, ostart, ostop : INTEGER) : INTEGER;
BEGIN
    RETURN ostart + (ostop - ostart) * ((value - istart) DIV (istop - istart))
END Map;


PROCEDURE Do*;
BEGIN
  (* init graphics *)
  D.CreateCanvas("canvas");
  D.Start;
  width := 640.0;
  height := 360.0;
  D.SetSize(FLOOR(width), FLOOR(height));
  D.NoLoop;
  D.SetBackground(255H);
  D.NoFill;

  w := 4.0;
  h := (w * height) / width;

  xmin := -w/2.0;
  ymin := -h/2.0;

  maxiterations := 100;

  xmax := xmin + w;
  ymax := ymin + h;

  dx := (xmax - xmin) / (width);
  dy := (ymax - ymin) / (height);

  y := ymin;



  FOR j := 0 TO FLOOR(height) BY 1 DO
    x := xmin;

    FOR i := 0 TO FLOOR(width) BY 1 DO
      a := x;
      b := y;
      n := 0;

      max := 4.0;
      absOld := 0.0;
      convergeNumber := maxiterations;
      break := FALSE;

      WHILE (n < maxiterations) & (break = FALSE)  DO


        aa := a * a;

        bb := b * b;
        abs := 0.1;

        abs := Math.Sqrt(aa + bb);


        IF (abs > max) THEN
          diffToLast := abs - absOld;
          diffToMax  := max - absOld;
          convergeNumber := n + FLOOR(diffToMax/diffToLast);
          break := TRUE;
        END ;


        IF break = FALSE THEN
          twoab := 2.0 * a * b;
          a := aa - bb + x;
          b := twoab + y;
          n := n + 1;
          absOld := abs;
        END;


      END;


      IF n = maxiterations THEN
        D.NoFill;
        D.Stroke(0FFFF0000H);
        D.Pointi(i, j);
      ELSE
        norm := convergeNumber * 10 MOD 255;
        (*norm := Map(convergeNumber, 0, maxiterations, 0, 1);*)
        (*norm := Map(FLOOR(Math.Sqrt(FLT(norm))), 0, 1, 0, 255);        *)
         D.NoFill;
        D.Stroke(norm);
        (* D.NoStroke; *)
        D.Pointi(i, j);

      END;
      x := x + dx;
    END;
    y := y + dy;


  END;

END Do;

BEGIN
 Do
END Init.
