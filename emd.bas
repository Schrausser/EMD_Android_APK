!!
             EMD v4.0

           © 1994-2023
      by Dietmar Schrausser
!!

INCLUDE strg.txt
GR.OPEN 255,0,0,0,0,1
GR.SCREEN sx,sy
GR.COLOR 255,0,255,0,1
w=sx*0.1
y=sy/3:a=0:b=sx-w
INPUT"EMD v=…",st,10
DO
 FOR i=a TO b STEP st
  GR.RECT rc, i,y,i+w,y*2
  GR.RENDER
  GR.CLS
 NEXT
 _a=a:a=b:b=_a:st=st*-1
UNTIL0
ONBACKKEY:
PRINT _cr$+" 1994-2023 by Dietmar Schrausser" 
END
