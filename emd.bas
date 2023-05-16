!!
             Eye Movement Desensitization for Android
                          ©1994-2023
                    by Dietmar G. Schrausser
!!
_name$="EMD"
_ver$="v4.5.7"
INCLUDE strg.inc
__sd_=RND() 
cr=0:cg=255:cb=0
GR.OPEN 255,0,0,0,0,1
GR.SCREEN sx,sy
s_=sy/sx                 % // screen_xy ratio              //
!                          // vertical- or horizontal: bar //
ARRAY.LOAD col$[], "High", "Low"
DIALOG.SELECT col, col$[],"Brightness..."
ARRAY.LOAD ino$[], "Landscape", "Portrait"
DIALOG.SELECT ino, ino$[],"Screen Orientation..."
or=0: IF ino=2 THEN or=1
INPUT"Color change probability p[0,1]...",c_p,0.125
c_p=ABS(c_p)
IF c_p>1 THEN c_p=0
! //
wdt=10                    % // width of bar, def. :10 -10   //
wdt=wdt/100               % // parameter corr               //
hgt=5                     % // hight of bar, def. :10 -3    //
y=sy/hgt                  % // parameter                    //
ch=3.3                    % // hight- ratio clorr def. 3    //
IF or=1                   % // vertical -                   //
 w=sy*(wdt/s_)            % // width-                       //
 y=y*(s_*(ch/s_) )        % // hight-                       //
 b=sx-w                   % // run end-                     //
 INPUT "Vertical Velocity v[1,100]...",st,10    
ELSE                      % // horizontal :                 //
 w=sx*wdt                 % // width:                       //
 y=y/s_                   % // hight:                       //
 b=sy-w                   % // run end:                     //
 INPUT "Horizontal Velocity v[1,100]...",st,20  
ENDIF
st=ABS(st):IF st<=0 THEN st=0.1
IF st>100 THEN st=100
a=0                       % // run start                    //
DO
 GOSUB sigma
 IF n__<c_p                % // change color p               //
  cg=0:cb=255
 ELSE
  cg=255:cb=0
 ENDIF
 IF col=2:cg=cg/4:cb=cb/4 
 ENDIF                    % // bright                       //
 GR.COLOR 255,cr,cg,cb,1  % // color                        //
 FOR i=a TO b STEP st
  IF or=1
   GR.RECT rc, i,y,i+w, sy-y % // draw-                     //
  ELSE
   GR.RECT rc, y,i,sx-y,i+w  % // draw:                     //
  ENDIF
  GR.RENDER
  GR.CLS
 NEXT
 _a=a:a=b:b=_a
 st=st*-1                  % //   run rev                   //
UNTIL0
ONERROR:
GOSUB fin
ONBACKKEY:
GOSUB fin
END
sigma::INCLUDE sigma.inc:RETURN
fin:
CONSOLE.TITLE _name$
PRINT _name$+" Eye Movement Desensitization "+_ver$
PRINT "Copyright "+_cr$+" 1994-2023 by Dietmar Gerald Schrausser"
PRINT "http://github.com/Schrausser/EMD_Android_APK"
PRINT "DOI:10.5281/zenodo.7644238"
END
RETURN
! //
