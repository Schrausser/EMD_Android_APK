!!
             Eye Movement Desensitization for Android
                          ©1994-2023
                    by Dietmar G. Schrausser
!!
_name$="EMD"
_ver$="4.5"
INCLUDE strg.txt
cr=0:cg=255:cb=0
GR.OPEN 255,0,0,0,0,1
GR.SCREEN sx,sy
s_=sy/sx                  % // screen_xy ratio              //
!                           // vertical- or horizontal: bar //
INPUT"Orientation[0:/1-]",or,0
INPUT"Color p[0,1]",c_p,0.125
INPUT"Brightness[1hi/2lo]",col,1
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
 INPUT_name$+" v-",st,10  % // speed-                       //
ELSE                      % // horizontal :                 //
 w=sx*wdt                 % // width:                       //
 y=y/s_                   % // hight:                       //
 b=sy-w                   % // run end:                     //
 INPUT_name$+" v:",st,20  % // speed:                       //
ENDIF
a=0                       % // run start                    //
DO
 cr=RND() 
 IF cr<c_p                % // change color p               //
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
fin:
CONSOLE.TITLE _name$
PRINT _name$+" Eye Movement Desensitization "+_ver$
PRINT "Copyright "+_cr$+" 1994-2023 by Dietmar Gerald Schrausser"
PRINT "http://github.com/Schrausser/EMD_Android_APK"
PRINT "DOI:10.5281/zenodo.7644238"
END
RETURN
! //
