!!
             EMD v4.2

           © 1994-2023
      by Dietmar G. Schrausser
!!

INCLUDE strg.txt
cr=0:cg=255:cb=0
GR.OPEN 255,0,0,0,0,1
INPUT"Orientation[0:/1--]",or,0
!! 
INPUT"Color[1:G/2:B]",col,1
IF col=2 
 cg=50:cb=100
ENDIF
!! 
GR.COLOR 255,cr,cg,cb,1
wdt=0.1
hgt=3
IF or=1
 GR.SCREEN sx,sy
 w=sx*wdt:y=sy/hgt:a=0:b=sx-w
 INPUT"EMD v=",st,10
ELSE
 GR.SCREEN sy,sx
 w=sy*wdt:y=sx/(hgt*2):a=0:b=sx-w
 INPUT"EMD v:",st,20
ENDIF
DO
 FOR i=a TO b STEP st
  IF or=1
   GR.RECT rc, i,y,i+w,y*2
  ELSE
   GR.RECT rc, y/2,i,y*5/2,i+w
  ENDIF
  GR.RENDER
  GR.CLS
 NEXT
 _a=a:a=b:b=_a:st=st*-1
UNTIL0
ONBACKKEY:
PRINT _cr$+" 1994-2023 by Dietmar G. Schrausser" 
END
