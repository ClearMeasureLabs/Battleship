�R
9C:\working\spam-vsts\src\Battleship.GameController\Bus.cs
	namespace 	

Battleship
 
. 
GameController #
{ 
public 

delegate 
object !
SingleInstanceFactory 0
(0 1
Type1 5
serviceType6 A
)A B
;B C
public		 

delegate		 
IEnumerable		 
<		  
object		  &
>		& ' 
MultiInstanceFactory		( <
(		< =
Type		= A
serviceType		B M
)		M N
;		N O
public 

class 
Bus 
{ 
private 
readonly !
SingleInstanceFactory ."
_singleInstanceFactory/ E
;E F
private 
readonly  
MultiInstanceFactory -!
_multiInstanceFactory. C
;C D
public 
Bus 
( 
) 
{ 	
} 	
public 
Bus 
( !
SingleInstanceFactory (!
singleInstanceFactory) >
,> ? 
MultiInstanceFactory@ T 
multiInstanceFactoryU i
)i j
{ 	"
_singleInstanceFactory "
=# $!
singleInstanceFactory% :
;: ;!
_multiInstanceFactory !
=" # 
multiInstanceFactory$ 8
;8 9
} 	
public 
virtual 
	TResponse  
Send! %
<% &
	TResponse& /
>/ 0
(0 1
IRequest1 9
<9 :
	TResponse: C
>C D
requestE L
)L M
{ 	
Trace 
. 
	WriteLine 
( 
string "
." #
Format# )
() *
$str* =
,= >
request? F
.F G
GetTypeG N
(N O
)O P
.P Q
FullNameQ Y
)Y Z
)Z [
;[ \
var 
defaultHandler 
=  

GetHandler! +
(+ ,
request, 3
)3 4
;4 5
	TResponse 
result 
= 
defaultHandler -
.- .
Handle. 4
(4 5
request5 <
)< =
;= >
return!! 
result!! 
;!! 
}"" 	
public$$ 
virtual$$ 
void$$ 
	SendEvent$$ %
<$$% &
	TResponse$$& /
>$$/ 0
($$0 1
IRequest$$1 9
<$$9 :
	TResponse$$: C
>$$C D
request$$E L
)$$L M
{%% 	
Trace&& 
.&& 
	WriteLine&& 
(&& 
string&& "
.&&" #
Format&&# )
(&&) *
$str&&* =
,&&= >
request&&? F
.&&F G
GetType&&G N
(&&N O
)&&O P
.&&P Q
FullName&&Q Y
)&&Y Z
)&&Z [
;&&[ \
var'' 
handlers'' 
='' 
GetHandlers'' &
(''& '
request''' .
)''. /
;''/ 0
foreach(( 
((( 
var(( 
handler((  
in((! #
handlers(($ ,
)((, -
{)) 
handler** 
.** 
Handle** 
(** 
request** &
)**& '
;**' (
}++ 
},, 	
private.. 
IEnumerable.. 
<.. 
RequestHandler.. *
<..* +
	TResponse..+ 4
>..4 5
>..5 6
GetHandlers..7 B
<..B C
	TResponse..C L
>..L M
(..M N
IRequest..N V
<..V W
	TResponse..W `
>..` a
request..b i
)..i j
{// 	
var00 
handlerType00 
=00 
typeof00 $
(00$ %
IRequestHandler00% 4
<004 5
,005 6
>006 7
)007 8
.008 9
MakeGenericType009 H
(00H I
request00I P
.00P Q
GetType00Q X
(00X Y
)00Y Z
,00Z [
typeof00\ b
(00b c
	TResponse00c l
)00l m
)00m n
;00n o
var11 
wrapperType11 
=11 
typeof11 $
(11$ %
RequestHandler11% 3
<113 4
,114 5
>115 6
)116 7
.117 8
MakeGenericType118 G
(11G H
request11H O
.11O P
GetType11P W
(11W X
)11X Y
,11Y Z
typeof11[ a
(11a b
	TResponse11b k
)11k l
)11l m
;11m n
IEnumerable22 
<22 
object22 
>22 
handlers22  (
;22( )
try33 
{44 
handlers55 
=55 !
_multiInstanceFactory55 0
(550 1
handlerType551 <
)55< =
;55= >
}66 
catch77 
(77 
	Exception77 
e77 
)77 
{88 
throw99 
new99 %
InvalidOperationException99 3
(993 4
$str994 `
+99a b
request99c j
.99j k
GetType99k r
(99r s
)99s t
,99t u
e99v w
)99w x
;99x y
}:: 
foreach<< 
(<< 
var<< 
handler<<  
in<<! #
handlers<<$ ,
)<<, -
{== 
var>> 
wrapperHandler>> "
=>># $
	Activator>>% .
.>>. /
CreateInstance>>/ =
(>>= >
wrapperType>>> I
,>>I J
handler>>K R
)>>R S
;>>S T
yield?? 
return?? 
(?? 
RequestHandler?? ,
<??, -
	TResponse??- 6
>??6 7
)??7 8
wrapperHandler??8 F
;??F G
}@@ 
}AA 	
privateCC 
RequestHandlerCC 
<CC 
	TResponseCC (
>CC( )

GetHandlerCC* 4
<CC4 5
	TResponseCC5 >
>CC> ?
(CC? @
IRequestCC@ H
<CCH I
	TResponseCCI R
>CCR S
requestCCT [
)CC[ \
{DD 	
varEE 
handlerTypeEE 
=EE 
typeofEE $
(EE$ %
IRequestHandlerEE% 4
<EE4 5
,EE5 6
>EE6 7
)EE7 8
.EE8 9
MakeGenericTypeEE9 H
(EEH I
requestEEI P
.EEP Q
GetTypeEEQ X
(EEX Y
)EEY Z
,EEZ [
typeofEE\ b
(EEb c
	TResponseEEc l
)EEl m
)EEm n
;EEn o
varFF 
wrapperTypeFF 
=FF 
typeofFF $
(FF$ %
RequestHandlerFF% 3
<FF3 4
,FF4 5
>FF5 6
)FF6 7
.FF7 8
MakeGenericTypeFF8 G
(FFG H
requestFFH O
.FFO P
GetTypeFFP W
(FFW X
)FFX Y
,FFY Z
typeofFF[ a
(FFa b
	TResponseFFb k
)FFk l
)FFl m
;FFm n
objectGG 
handlerGG 
;GG 
tryHH 
{II 
handlerJJ 
=JJ "
_singleInstanceFactoryJJ 0
(JJ0 1
handlerTypeJJ1 <
)JJ< =
;JJ= >
ifLL 
(LL 
handlerLL 
==LL 
nullLL #
)LL# $
throwMM 
newMM %
InvalidOperationExceptionMM 7
(MM7 8
$strMM8 d
+MMe f
requestMMg n
.MMn o
GetTypeMMo v
(MMv w
)MMw x
)MMx y
;MMy z
}NN 
catchOO 
(OO 
	ExceptionOO 
eOO 
)OO 
{PP 
throwQQ 
newQQ %
InvalidOperationExceptionQQ 3
(QQ3 4
$strQQ4 `
+QQa b
requestQQc j
.QQj k
GetTypeQQk r
(QQr s
)QQs t
,QQt u
eQQv w
)QQw x
;QQx y
}RR 
varSS 
wrapperHandlerSS 
=SS  
	ActivatorSS! *
.SS* +
CreateInstanceSS+ 9
(SS9 :
wrapperTypeSS: E
,SSE F
handlerSSG N
)SSN O
;SSO P
returnTT 
(TT 
RequestHandlerTT "
<TT" #
	TResponseTT# ,
>TT, -
)TT- .
wrapperHandlerTT. <
;TT< =
}UU 	
privateWW 
abstractWW 
classWW 
RequestHandlerWW -
<WW- .
TResultWW. 5
>WW5 6
{XX 	
publicYY 
abstractYY 
TResultYY #
HandleYY$ *
(YY* +
IRequestYY+ 3
<YY3 4
TResultYY4 ;
>YY; <
messageYY= D
)YYD E
;YYE F
}ZZ 	
private\\ 
class\\ 
RequestHandler\\ $
<\\$ %
TCommand\\% -
,\\- .
TResult\\/ 6
>\\6 7
:\\8 9
RequestHandler\\: H
<\\H I
TResult\\I P
>\\P Q
where\\R W
TCommand\\X `
:\\a b
IRequest\\c k
<\\k l
TResult\\l s
>\\s t
{]] 	
private^^ 
readonly^^ 
IRequestHandler^^ ,
<^^, -
TCommand^^- 5
,^^5 6
TResult^^7 >
>^^> ?
_inner^^@ F
;^^F G
public`` 
RequestHandler`` !
(``! "
IRequestHandler``" 1
<``1 2
TCommand``2 :
,``: ;
TResult``< C
>``C D
inner``E J
)``J K
{aa 
_innerbb 
=bb 
innerbb 
;bb 
}cc 
publicee 
overrideee 
TResultee #
Handleee$ *
(ee* +
IRequestee+ 3
<ee3 4
TResultee4 ;
>ee; <
messageee= D
)eeD E
{ff 
returngg 
_innergg 
.gg 
Handlegg $
(gg$ %
(gg% &
TCommandgg& .
)gg. /
messagegg/ 6
)gg6 7
;gg7 8
}hh 
}ii 	
}kk 
publicmm 

enummm 
RequestStatusmm 
{nn 
Successoo 
}pp 
}qq �
WC:\working\spam-vsts\src\Battleship.GameController\Commands\InitializeMyFleetCommand.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Commands$ ,
{ 
public 

class $
InitializeMyFleetCommand )
:* +
IRequest, 4
<4 5
List5 9
<9 :
Ship: >
>> ?
>? @
{ 
}

 
} �
NC:\working\spam-vsts\src\Battleship.GameController\Commands\ShowSunkCommand.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Commands$ ,
{ 
public 

class 
ShowSunkCommand  
:! "
IRequest# +
<+ ,
EventAck, 4
>4 5
{ 
public 
ConsoleColor 
Color !
{" #
get$ '
;' (
}) *
public		 
string		 
Message		 
{		 
get		  #
;		# $
}		% &
public 
ShowSunkCommand 
( 
ConsoleColor +
color, 1
,1 2
string3 9
message: A
)A B
{ 	
Color 
= 
color 
; 
Message 
= 
message 
; 
} 	
} 
} �
RC:\working\spam-vsts\src\Battleship.GameController\Contracts\ColorConfiguration.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

class 
ColorConfiguration #
{ 
public 
ConsoleColor 
	GoodThing %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
ConsoleColor		 
BadThing		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
ConsoleColor

 
MinorBad

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
} 
} �#
JC:\working\spam-vsts\src\Battleship.GameController\Contracts\Coordinate.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

class 

Coordinate 
: 

IEquatable (
<( )

Coordinate) 3
>3 4
{ 
public 
Letters 
Column 
{ 
get  #
;# $
}% &
public		 
int		 
Row		 
{		 
get		 
;		 
}		 
public 

Coordinate 
( 
string  
positionCode! -
)- .
{ 	
var 
column 
= 
( 
Letters !
)! "
Enum" &
.& '
Parse' ,
(, -
typeof- 3
(3 4
Letters4 ;
); <
,< =
positionCode> J
.J K
ToUpperK R
(R S
)S T
.T U
	SubstringU ^
(^ _
$num_ `
,` a
$numb c
)c d
)d e
;e f
var 
row 
= 
int 
. 
Parse 
(  
positionCode  ,
., -
	Substring- 6
(6 7
$num7 8
,8 9
$num: ;
); <
)< =
;= >
Column 
= 
column 
; 
Row 
= 
row 
; 
} 	
public 

Coordinate 
( 
Letters !
column" (
,( )
int* -
row. 1
)1 2
{ 	
Column 
= 
column 
; 
Row 
= 
row 
; 
} 	
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
return 
Equals 
( 
obj 
as  

Coordinate! +
)+ ,
;, -
} 	
public 
bool 
Equals 
( 

Coordinate %
other& +
)+ ,
{ 	
return   
other   
!=   
null    
&&  ! #
Column!! 
==!! 
other!! "
.!!" #
Column!!# )
&&!!* ,
Row"" 
=="" 
other"" 
.""  
Row""  #
;""# $
}## 	
public%% 
override%% 
int%% 
GetHashCode%% '
(%%' (
)%%( )
{&& 	
var'' 
hashCode'' 
='' 
$num'' $
;''$ %
hashCode(( 
=(( 
hashCode(( 
*((  !
-((" #
$num((# -
+((. /
Column((0 6
.((6 7
GetHashCode((7 B
(((B C
)((C D
;((D E
hashCode)) 
=)) 
hashCode)) 
*))  !
-))" #
$num))# -
+)). /
Row))0 3
.))3 4
GetHashCode))4 ?
())? @
)))@ A
;))A B
return** 
hashCode** 
;** 
}++ 	
public-- 
static-- 
bool-- 
operator-- #
==--$ &
(--& '

Coordinate--' 1
coordinate1--2 =
,--= >

Coordinate--? I
coordinate2--J U
)--U V
{.. 	
return// 
EqualityComparer// #
<//# $

Coordinate//$ .
>//. /
./// 0
Default//0 7
.//7 8
Equals//8 >
(//> ?
coordinate1//? J
,//J K
coordinate2//L W
)//W X
;//X Y
}00 	
public22 
static22 
bool22 
operator22 #
!=22$ &
(22& '

Coordinate22' 1
coordinate1222 =
,22= >

Coordinate22? I
coordinate222J U
)22U V
{33 	
return44 
!44 
(44 
coordinate144  
==44! #
coordinate244$ /
)44/ 0
;440 1
}55 	
}66 
}77 �
HC:\working\spam-vsts\src\Battleship.GameController\Contracts\EventAck.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

enum 
EventAck 
{ 
Ok 

} 
} �
EC:\working\spam-vsts\src\Battleship.GameController\Contracts\Board.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

class 
Board 
{ 
public		 
IEnumerable		 
<		 
Ship		 
>		  
Fleet		! &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
public

 
int

 
Size

 
{

 
get

 
;

 
set

 "
;

" #
}

$ %
public 
Board 
( 
) 
{ 	
Fleet 
= 
Ship 
. 
GetNewFleet $
($ %
)% &
;& '
Size 
= 
$num 
; 
} 	
public 
bool 
IsHit 
( 

Coordinate $

coordinate% /
)/ 0
{ 	
bool 
shipIsAtCoordinate #
=$ %
Fleet& +
.+ ,
Any, /
(/ 0
x0 1
=>2 4
x5 6
.6 7
IsAt7 ;
(; <

coordinate< F
)F G
)G H
;H I
return 
shipIsAtCoordinate %
;% &
} 	
public 
Ship 
ShipAt 
( 

Coordinate %

coordinate& 0
)0 1
{ 	
Ship 
ship 
= 
Fleet 
. 
FirstOrDefault ,
(, -
x- .
=>/ 1
x2 3
.3 4
	Positions4 =
.= >
Any> A
(A B
yB C
=>D F
yG H
.H I

CoordinateI S
.S T
EqualsT Z
(Z [

coordinate[ e
)e f
)f g
)g h
;h i
return 
ship 
; 
} 	
public 
bool 
IsShipAt 
( 

Coordinate '

coordinate( 2
)2 3
{ 	
return   
Fleet   
.   
Any   
(   
x   
=>   !
x  " #
.  # $
	Positions  $ -
.  - .
Any  . 1
(  1 2
y  2 3
=>  4 6
y  7 8
.  8 9

Coordinate  9 C
.  C D
Equals  D J
(  J K

coordinate  K U
)  U V
)  V W
)  W X
;  X Y
}!! 	
}"" 
}## �
DC:\working\spam-vsts\src\Battleship.GameController\Contracts\Game.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

class 
Game 
{ 
public 
Board 
PlayerBoard  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
Board		 
ComputerBoard		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
ColorConfiguration

 !
Configuration

" /
{

0 1
get

2 5
;

5 6
set

7 :
;

: ;
}

< =
public 
Game 
( 
) 
{ 	
PlayerBoard 
= 
new 
Board #
(# $
)$ %
;% &
ComputerBoard 
= 
new 
Board  %
(% &
)& '
;' (
Configuration 
= 
new 
ColorConfiguration  2
(2 3
)3 4
{ 
BadThing 
= 
ConsoleColor '
.' (
Red( +
,+ ,
	GoodThing 
= 
ConsoleColor (
.( )
Green) .
,. /
MinorBad 
= 
ConsoleColor '
.' (

DarkYellow( 2
} 
; 
} 	
} 
} �#
HC:\working\spam-vsts\src\Battleship.GameController\Contracts\Position.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

class 
Position 
: 

IEquatable &
<& '
Position' /
>/ 0
{ 
public 

Coordinate 

Coordinate $
;$ %
public		 
PositionStatus		 
Status		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
Ship

 
ShipAtThisPosition

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
Position 
( 
Letters 
column  &
,& '
int( +
row, /
,/ 0
Ship1 5
shipAtThisPosition6 H
)H I
:J K
thisL P
(P Q
columnQ W
,W X
rowY \
)\ ]
{ 	
ShipAtThisPosition 
=  
shipAtThisPosition! 3
;3 4
} 	
public 
Position 
( 
Letters 
column  &
,& '
int( +
row, /
)/ 0
:1 2
this3 7
(7 8
)8 9
{ 	

Coordinate 
= 
new 

Coordinate '
(' (
column( .
,. /
row0 3
)3 4
;4 5
} 	
private 
Position 
( 
) 
{ 	
Status 
= 
PositionStatus #
.# $
None$ (
;( )
} 	
public 
Position 
( 

Coordinate "

coordinate# -
,- .
Ship/ 3
ship4 8
)8 9
:: ;
this< @
(@ A
)A B
{ 	

Coordinate 
= 

coordinate #
;# $
ShipAtThisPosition 
=  
ship! %
;% &
} 	
public   
override   
bool   
Equals   #
(  # $
object  $ *
obj  + .
)  . /
{!! 	
return"" 
Equals"" 
("" 
obj"" 
as""  
Position""! )
)"") *
;""* +
}## 	
public%% 
bool%% 
Equals%% 
(%% 
Position%% #
other%%$ )
)%%) *
{&& 	
return'' 
other'' 
!='' 
null''  
&&''! #
EqualityComparer(( #
<((# $

Coordinate(($ .
>((. /
.((/ 0
Default((0 7
.((7 8
Equals((8 >
(((> ?

Coordinate((? I
,((I J
other((K P
.((P Q

Coordinate((Q [
)(([ \
;((\ ]
})) 	
public++ 
override++ 
int++ 
GetHashCode++ '
(++' (
)++( )
{,, 	
return-- 
--- 
$num-- 
+--  
EqualityComparer--! 1
<--1 2

Coordinate--2 <
>--< =
.--= >
Default--> E
.--E F
GetHashCode--F Q
(--Q R

Coordinate--R \
)--\ ]
;--] ^
}.. 	
public00 
static00 
bool00 
operator00 #
==00$ &
(00& '
Position00' /
	position1000 9
,009 :
Position00; C
	position200D M
)00M N
{11 	
return22 
EqualityComparer22 #
<22# $
Position22$ ,
>22, -
.22- .
Default22. 5
.225 6
Equals226 <
(22< =
	position122= F
,22F G
	position222H Q
)22Q R
;22R S
}33 	
public55 
static55 
bool55 
operator55 #
!=55$ &
(55& '
Position55' /
	position1550 9
,559 :
Position55; C
	position255D M
)55M N
{66 	
return77 
!77 
(77 
	position177 
==77 !
	position277" +
)77+ ,
;77, -
}88 	
}99 
}:: �
GC:\working\spam-vsts\src\Battleship.GameController\Contracts\Letters.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

enum 
Letters 
{ 
A 	
,	 

B 	
,	 

C 	
,	 

D 	
,	 

E		 	
,			 

F

 	
,

	 

G 	
,	 

H 	
,	 

I 	
,	 

J 	
} 
} �
NC:\working\spam-vsts\src\Battleship.GameController\Contracts\PositionStatus.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

enum 
PositionStatus 
{ 
None 
, 
Hit 
, 
Miss 
} 
}		 �-
DC:\working\spam-vsts\src\Battleship.GameController\Contracts\Ship.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
	Contracts$ -
{ 
public 

class 
Ship 
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
List

 
<

 
Position

 
>

 
	Positions

 '
{

( )
get

* -
;

- .
set

/ 2
;

2 3
}

4 5
public 
Color 
Color 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Size 
{ 
get 
; 
set "
;" #
}$ %
public 
Ship 
( 
) 
{ 	
	Positions 
= 
new 
List  
<  !
Position! )
>) *
(* +
)+ ,
;, -
} 	
public 
void 
AddPosition 
(  
string  &
positionCode' 3
)3 4
{ 	
var 

coordinate 
= 
new  

Coordinate! +
(+ ,
positionCode, 8
)8 9
;9 :
var 
position 
= 
new 
Position '
(' (

coordinate( 2
,2 3
this4 8
)8 9
;9 :
	Positions 
. 
Add 
( 
position "
)" #
;# $
} 	
public 
static 
IEnumerable !
<! "
Ship" &
>& '
GetNewFleet( 3
(3 4
)4 5
{ 	
return 
new 
List 
< 
Ship  
>  !
{ 
new 
Ship 
{ 
Name 
=  
AircraftCarrier! 0
,0 1
Size2 6
=7 8
$num9 :
,: ;
Color< A
=B C
ColorsD J
.J K
	CadetBlueK T
}T U
,U V
new 
Ship 
{ 
Name 
=  

Battleship! +
,+ ,
Size- 1
=2 3
$num4 5
,5 6
Color7 <
== >
Colors? E
.E F
RedF I
}I J
,J K
new   
Ship   
{   
Name   
=    
	Submarine  ! *
,  * +
Size  , 0
=  1 2
$num  3 4
,  4 5
Color  6 ;
=  < =
Colors  > D
.  D E

Chartreuse  E O
}  O P
,  P Q
new!! 
Ship!! 
{!! 
Name!! 
=!!  
	Destroyer!!! *
,!!* +
Size!!, 0
=!!1 2
$num!!3 4
,!!4 5
Color!!6 ;
=!!< =
Colors!!> D
.!!D E
Yellow!!E K
}!!K L
,!!L M
new"" 
Ship"" 
{"" 
Name"" 
=""  

PatrolBoat""! +
,""+ ,
Size""- 1
=""2 3
$num""4 5
,""5 6
Color""7 <
=""= >
Colors""? E
.""E F
Orange""F L
}""L M
}## 
;## 
}$$ 	
public&& 
const&& 
string&& 
AircraftCarrier&& +
=&&, -
$str&&. @
;&&@ A
public'' 
const'' 
string'' 

Battleship'' &
=''' (
$str'') 5
;''5 6
public(( 
const(( 
string(( 
	Submarine(( %
=((& '
$str((( 3
;((3 4
public)) 
const)) 
string)) 
	Destroyer)) %
=))& '
$str))( 3
;))3 4
public** 
const** 
string** 

PatrolBoat** &
=**' (
$str**) 6
;**6 7
public,, 
bool,, 
IsAt,, 
(,, 

Coordinate,, #

coordinate,,$ .
),,. /
{-- 	
foreach.. 
(.. 
var.. 
position.. !
in.." $
	Positions..% .
)... /
{// 
if00 
(00 
position00 
.00 

Coordinate00 '
.00' (
Equals00( .
(00. /

coordinate00/ 9
)009 :
)00: ;
{11 
position22 
.22 
Status22 #
=22$ %
PositionStatus22& 4
.224 5
Hit225 8
;228 9
return33 
true33 
;33  
}44 
}55 
return77 
false77 
;77 
}88 	
public:: 
bool:: 
IsSunk:: 
(:: 
):: 
{;; 	
foreach<< 
(<< 
var<< 
position<< !
in<<" $
	Positions<<% .
)<<. /
{== 
if>> 
(>> 
position>> 
.>> 
Status>> #
!=>>$ &
PositionStatus>>' 5
.>>5 6
Hit>>6 9
)>>9 :
return?? 
false??  
;??  !
}@@ 
returnBB 
trueBB 
;BB 
}CC 	
}DD 
}EE �
YC:\working\spam-vsts\src\Battleship.GameController\Events\GameAnnouncementEvent - Copy.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Events$ *
{ 
public 

class 
UserMessageCommand #
:$ %
IRequest& .
<. /
EventAck/ 7
>7 8
{ 
public 
UserMessageCommand !
(! "
string" (
message) 0
)0 1
{ 	
Message		 
=		 
message		 
;		 
}

 	
public 
string 
Message 
{ 
get  #
;# $
}% &
} 
} �
MC:\working\spam-vsts\src\Battleship.GameController\Events\GameStartedEvent.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Events$ *
{ 
public 

class 
GameStartedEvent !
:" #
IRequest$ ,
<, -
EventAck- 5
>5 6
{ 
} 
} �
RC:\working\spam-vsts\src\Battleship.GameController\Events\GameAnnouncementEvent.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Events$ *
{ 
public 

class !
GameAnnouncementEvent &
:' (
IRequest) 1
<1 2
EventAck2 :
>: ;
{ 
public 
string 
Message 
{ 
get  #
;# $
}% &
public		 !
GameAnnouncementEvent		 $
(		$ %
string		% +
message		, 3
)		3 4
{

 	
Message 
= 
message 
; 
} 	
} 
} �x
DC:\working\spam-vsts\src\Battleship.GameController\GameController.cs
	namespace 	

Battleship
 
. 
GameController #
{ 
public 

class 
GameController 
{ 
private 
Game 
_game 
; 
private 
readonly 
Bus 
_bus !
;! "
private 
readonly  
ComputerAiController -!
_computerAiController. C
;C D
private 
List 
< 

Coordinate 
>  
_computersAttempts! 3
=4 5
new6 9
List: >
<> ?

Coordinate? I
>I J
(J K
)K L
;L M
private 

Coordinate 
_computerToFireAt ,
;, -
public 
GameController 
( 
Bus !
bus" %
)% &
{ 	
_bus 
= 
bus 
; !
_computerAiController !
=" #
new$ ' 
ComputerAiController( <
(< =
)= >
;> ?
_game 
= 
new 
Game 
( 
) 
; 
} 	
public 
void 
Run 
( 
) 
{ 	
_bus 
. 
	SendEvent 
( 
new 
GameStartedEvent /
(/ 0
)0 1
)1 2
;2 3
_bus 
. 
	SendEvent 
( 
new !
GameAnnouncementEvent 4
(4 5
$str5 L
)L M
)M N
;N O
InitializeGame   
(   
)   
;   
_bus"" 
."" 
	SendEvent"" 
("" 
new"" !
GameAnnouncementEvent"" 4
(""4 5
$str""5 I
)""I J
)""J K
;""K L
LoopGame## 
(## 
)## 
;## 
}$$ 	
private&& 
void&& 
InitializeGame&& #
(&&# $
)&&$ %
{'' 	
_bus(( 
.(( 
	SendEvent(( 
((( 
new(( !
GameAnnouncementEvent(( 4
(((4 5
$str((5 h
)((h i
)((i j
;((j k
InitializeMyFleet)) 
()) 
))) 
;))  
_bus** 
.** 
	SendEvent** 
(** 
new** !
GameAnnouncementEvent** 4
(**4 5
$str**5 h
)**h i
)**i j
;**j k!
_computerAiController++ !
.++! "
InitializeFleet++" 1
(++1 2
_game++2 7
.++7 8
ComputerBoard++8 E
)++E F
;++F G
}-- 	
private// 
void// 
LoopGame// 
(// 
)// 
{00 	
_bus11 
.11 
Send11 
(11 
new11 
ShowCannonCommand11 +
(11+ ,
)11, -
)11- .
;11. /
do22 
{33 
_bus44 
.44 
	SendEvent44 
(44 
new44 "!
GameAnnouncementEvent44# 8
(448 9
$str449 l
)44l m
)44m n
;44n o
_bus55 
.55 
Send55 
(55 
new55 
UserMessageCommand55 0
(550 1
$str551 J
)55J K
)55K L
;55L M
var66 
exitSelected66  
=66! "
ExecutePlayerTurn66# 4
(664 5
)665 6
;666 7
if77 
(77 
exitSelected77  
)77  !
break77" '
;77' (
_bus99 
.99 
	SendEvent99 
(99 
new99 "!
GameAnnouncementEvent99# 8
(998 9
$str999 l
)99l m
)99m n
;99n o
_bus:: 
.:: 
	SendEvent:: 
(:: 
new:: "!
GameAnnouncementEvent::# 8
(::8 9
$str::9 T
)::T U
)::U V
;::V W
ExecuteComputerTurn<< #
(<<# $
)<<$ %
;<<% &
}== 
while== 
(== 
true== 
)== 
;== 
}>> 	
private@@ 
void@@ 
InitializeMyFleet@@ &
(@@& '
)@@' (
{AA 	
_busBB 
.BB 
SendBB 
(BB 
newBB 
UserMessageCommandBB ,
(BB, -
$strBB- x
)BBx y
)BBy z
;BBz {
foreachDD 
(DD 
varDD 
shipDD 
inDD  
_gameDD! &
.DD& '
PlayerBoardDD' 2
.DD2 3
FleetDD3 8
)DD8 9
{EE 
_busFF 
.FF 
	SendEventFF 
(FF 
newFF "!
GameAnnouncementEventFF# 8
(FF8 9
$strFF9 ;
)FF; <
)FF< =
;FF= >
_busGG 
.GG 
SendGG 
(GG 
newGG 
UserMessageCommandGG 0
(GG0 1
$"GG1 3/
#Please enter the positions for the GG3 V
{GGV W
shipGGW [
.GG[ \
NameGG\ `
}GG` a
 (size: GGa i
{GGi j
shipGGj n
.GGn o
SizeGGo s
}GGs t
)GGt u
"GGu v
)GGv w
)GGw x
;GGx y
forII 
(II 
varII 
iII 
=II 
$numII 
;II 
iII  !
<=II" $
shipII% )
.II) *
SizeII* .
;II. /
iII0 1
++II1 3
)II3 4
{JJ 
varKK 
inputKK 
=KK 
_busKK  $
.KK$ %
SendKK% )
(KK) *
newKK* -
UserPromptQueryKK. =
(KK= >
$"KK> @
Enter position KK@ O
{KKO P
iKKP Q
}KKQ R
 of KKR V
{KKV W
shipKKW [
.KK[ \
SizeKK\ `
}KK` a

 (i.e A3):KKa k
"KKk l
)KKl m
)KKm n
;KKn o
shipLL 
.LL 
AddPositionLL $
(LL$ %
inputLL% *
)LL* +
;LL+ ,
}MM 
}NN 
}OO 	
privateQQ 
boolQQ 
ExecutePlayerTurnQQ &
(QQ& '
)QQ' (
{RR 	
varSS 
inputSS 
=SS 
_busSS 
.SS 
SendSS !
(SS! "
newSS" %
UserPromptQuerySS& 5
(SS5 6
$strSS6 s
)SSs t
)SSt u
;SSu v
ifTT 
(TT 
inputTT 
.TT 
LengthTT 
==TT 
$numTT  !
)TT! "
{UU 
switchVV 
(VV 
inputVV 
?VV 
.VV 
ToUpperVV &
(VV& '
)VV' (
)VV( )
{WW 
caseXX 
$strXX 
:XX 
returnYY 
trueYY #
;YY# $
caseZZ 
$strZZ 
:ZZ 
_computerToFireAt[[ )
=[[* +
_computerToFireAt[[, =
!=[[> @
null[[A E
?[[F G
new[[H K

Coordinate[[L V
([[V W
Letters[[W ^
.[[^ _
A[[_ `
,[[` a
_computerToFireAt[[b s
.[[s t
Row[[t w
+[[w x
$num[[x y
)[[y z
:[[{ |
new	[[} �

Coordinate
[[� �
(
[[� �
Letters
[[� �
.
[[� �
A
[[� �
,
[[� �
$num
[[� �
)
[[� �
;
[[� �
return\\ 
false\\ $
;\\$ %
default]] 
:]] 
break^^ 
;^^ 
}__ 
}`` 
varbb 

coordinatebb 
=bb 
newbb  

Coordinatebb! +
(bb+ ,
inputbb, 1
)bb1 2
;bb2 3
boolcc 
isHitcc 
=cc 
_gamecc 
.cc 
ComputerBoardcc ,
.cc, -
IsHitcc- 2
(cc2 3

coordinatecc3 =
)cc= >
;cc> ?
ifdd 
(dd 
isHitdd 
)dd 
{ee 
Shipff 
shipff 
=ff 
_gameff !
.ff! "
ComputerBoardff" /
.ff/ 0
ShipAtff0 6
(ff6 7

coordinateff7 A
)ffA B
;ffB C
ifgg 
(gg 
shipgg 
.gg 
IsSunkgg 
(gg  
)gg  !
)gg! "
{hh 
_busii 
.ii 
Sendii 
(ii 
newii !
ShowSunkCommandii" 1
(ii1 2
_gameii2 7
.ii7 8
Configurationii8 E
.iiE F
	GoodThingiiF O
,iiO P
$striiQ b
)iib c
)iic d
;iid e
_busjj 
.jj 
	SendEventjj "
(jj" #
newjj# &!
GameAnnouncementEventjj' <
(jj< =
$"jj= ? 
You sank computer's jj? S
{jjS T
shipjjT X
.jjX Y
NamejjY ]
}jj] ^
"jj^ _
)jj_ `
)jj` a
;jja b
}kk 
elsell 
{mm 
_busnn 
.nn 
Sendnn 
(nn 
newnn !
ShowHitCommandnn" 0
(nn0 1
_gamenn1 6
.nn6 7
Configurationnn7 D
.nnD E
	GoodThingnnE N
,nnN O
$strnnP a
)nna b
)nnb c
;nnc d
}oo 
}pp 
elseqq 
{rr 
_busss 
.ss 
Sendss 
(ss 
newss 
ShowMissCommandss -
(ss- .
_gamess. 3
.ss3 4
Configurationss4 A
.ssA B
MinorBadssB J
,ssJ K
$strssL R
)ssR S
)ssS T
;ssT U
}tt 
returnvv 
falsevv 
;vv 
}ww 	
privateyy 
voidyy 
ExecuteComputerTurnyy (
(yy( )
)yy) *
{zz 	

Coordinate{{ 

coordinate{{ !
={{" #
null{{$ (
;{{( )
if|| 
(|| 
_computerToFireAt|| !
==||" $
null||% )
)||) *
{}} 
while~~ 
(~~ 

coordinate~~ !
==~~" $
null~~% )
)~~) *
{ 
var
�� 
theTry
�� 
=
��  #
_computerAiController
��! 6
.
��6 7$
ChooseRandomCoordinate
��7 M
(
��M N
_game
��N S
.
��S T
PlayerBoard
��T _
)
��_ `
;
��` a
if
�� 
(
�� 
!
��  
_computersAttempts
�� +
.
��+ ,
Contains
��, 4
(
��4 5
theTry
��5 ;
)
��; <
)
��< =
{
�� 

coordinate
�� "
=
��# $
theTry
��% +
;
��+ ,
}
��  
_computersAttempts
�� &
.
��& '
Add
��' *
(
��* +
theTry
��+ 1
)
��1 2
;
��2 3
foreach
�� 
(
�� 
var
��  
attempt
��! (
in
��) + 
_computersAttempts
��, >
)
��> ?
{
�� 
Debug
�� 
.
�� 
	WriteLine
�� '
(
��' (
attempt
��( /
)
��/ 0
;
��0 1
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 

coordinate
�� 
=
�� 
_computerToFireAt
�� .
;
��. /
}
�� 
bool
�� 
isHit
�� 
=
�� 
_game
�� 
.
�� 
PlayerBoard
�� *
.
��* +
IsHit
��+ 0
(
��0 1

coordinate
��1 ;
)
��; <
;
��< =
_bus
�� 
.
�� 
Send
�� 
(
�� 
new
��  
UserMessageCommand
�� ,
(
��, -
$"
��- /
Computer shot in 
��/ @
{
��@ A

coordinate
��A K
.
��K L
Column
��L R
}
��R S
{
��S T

coordinate
��T ^
.
��^ _
Row
��_ b
}
��b c
"
��c d
)
��d e
)
��e f
;
��f g
_bus
�� 
.
�� 
Send
�� 
(
�� 
new
��  
UserMessageCommand
�� ,
(
��, -
$str
��- /
)
��/ 0
)
��0 1
;
��1 2
if
�� 
(
�� 
isHit
�� 
)
�� 
{
�� 
Ship
�� 
ship
�� 
=
�� 
_game
�� !
.
��! "
PlayerBoard
��" -
.
��- .
ShipAt
��. 4
(
��4 5

coordinate
��5 ?
)
��? @
;
��@ A
if
�� 
(
�� 
ship
�� 
.
�� 
IsSunk
�� 
(
��  
)
��  !
)
��! "
{
�� 
_bus
�� 
.
�� 
Send
�� 
(
�� 
new
�� !
ShowSunkCommand
��" 1
(
��1 2
_game
��2 7
.
��7 8
Configuration
��8 E
.
��E F
BadThing
��F N
,
��N O
$str
��P i
)
��i j
)
��j k
;
��k l
_bus
�� 
.
�� 
	SendEvent
�� "
(
��" #
new
��# &#
GameAnnouncementEvent
��' <
(
��< =
$"
��= ?
Your 
��? D
{
��D E
ship
��E I
.
��I J
Name
��J N
}
��N O
 has been sunk
��O ]
"
��] ^
)
��^ _
)
��_ `
;
��` a
}
�� 
else
�� 
{
�� 
_bus
�� 
.
�� 
Send
�� 
(
�� 
new
�� !
ShowHitCommand
��" 0
(
��0 1
_game
��1 6
.
��6 7
Configuration
��7 D
.
��D E
BadThing
��E M
,
��M N
$str
��O h
)
��h i
)
��i j
;
��j k
}
�� 
}
�� 
else
�� 
{
�� 
_bus
�� 
.
�� 
Send
�� 
(
�� 
new
�� 
ShowMissCommand
�� -
(
��- .
_game
��. 3
.
��3 4
Configuration
��4 A
.
��A B
	GoodThing
��B K
,
��K L
$str
��M S
)
��S T
)
��T U
;
��U V
}
�� 
}
�� 	
public
�� 
bool
�� 
IsShipValid
�� 
(
��  
Ship
��  $
ship
��% )
)
��) *
{
�� 	
return
�� 
ship
�� 
.
�� 
	Positions
�� !
.
��! "
Count
��" '
==
��( *
ship
��+ /
.
��/ 0
Size
��0 4
;
��4 5
}
�� 	
}
�� 
}�� �
]C:\working\spam-vsts\src\Battleship.GameController\Handlers\ShowSplashOnGameStartedHandler.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Handlers$ ,
{ 
public 

class *
ShowSplashOnGameStartedHandler /
:0 1
IRequestHandler2 A
<A B
GameStartedEventB R
,R S
EventAckT \
>\ ]
{ 
public		 
EventAck		 
Handle		 
(		 
GameStartedEvent		 /
request		0 7
)		7 8
{

 	
Console 
. 
	WriteLine 
( 
$str H
)H I
;I J
Console 
. 
	WriteLine 
( 
$str I
)I J
;J K
Console 
. 
	WriteLine 
( 
$str H
)H I
;I J
Console 
. 
	WriteLine 
( 
$str J
)J K
;K L
Console 
. 
	WriteLine 
( 
$str J
)J K
;K L
Console 
. 
	WriteLine 
( 
$str K
)K L
;L M
Console 
. 
	WriteLine 
( 
$str N
)N O
;O P
Console 
. 
	WriteLine 
( 
$str R
)R S
;S T
Console 
. 
	WriteLine 
( 
$str i
)i j
;j k
Console 
. 
	WriteLine 
( 
$str m
)m n
;n o
Console 
. 
	WriteLine 
( 
$str o
)o p
;p q
Console 
. 
	WriteLine 
( 
$str n
)n o
;o p
Console 
. 
	WriteLine 
( 
$str m
)m n
;n o
Console 
. 
	WriteLine 
( 
) 
;  
return 
EventAck 
. 
Ok 
; 
} 	
} 
public 

class 

My2Handler 
: 
IRequestHandler -
<- .
GameStartedEvent. >
,> ?
EventAck@ H
>H I
{ 
public 
EventAck 
Handle 
( 
GameStartedEvent /
request0 7
)7 8
{   	
return"" 
EventAck"" 
."" 
Ok"" 
;"" 
}## 	
}$$ 
}%% �
>C:\working\spam-vsts\src\Battleship.GameController\IRequest.cs
	namespace 	

Battleship
 
. 
GameController #
{ 
public 

	interface 
IRequest 
< 
out !
	TResponse" +
>+ ,
{ 
} 
} �
EC:\working\spam-vsts\src\Battleship.GameController\IRequestHandler.cs
	namespace 	

Battleship
 
. 
GameController #
{ 
public 

	interface 
IRequestHandler $
<$ %
in% '
TRequest( 0
,0 1
out2 5
	TResponse6 ?
>? @
whereA F
TRequestG O
:P Q
IRequestR Z
<Z [
	TResponse[ d
>d e
{ 
	TResponse 
Handle 
( 
TRequest !
request" )
)) *
;* +
} 
} ��
LC:\working\spam-vsts\src\Battleship.GameController\Properties\Annotations.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Annotations$ /
{ 
[ 
AttributeUsage 
( 
AttributeTargets 
. 
Method 
| 
AttributeTargets .
.. /
	Parameter/ 8
|9 :
AttributeTargets 
. 
Property 
| 
AttributeTargets  0
.0 1
Delegate1 9
|: ;
AttributeTargets 
. 
Field 
, 
AllowMultiple )
=* +
false, 1
,1 2
	Inherited3 <
== >
true? C
)C D
]D E
public 
sealed	 
class 
CanBeNullAttribute (
:) *
	Attribute+ 4
{5 6
}7 8
[&& 
AttributeUsage&& 
(&& 
AttributeTargets'' 
.'' 
Method'' 
|'' 
AttributeTargets'' .
.''. /
	Parameter''/ 8
|''9 :
AttributeTargets(( 
.(( 
Property(( 
|(( 
AttributeTargets((  0
.((0 1
Delegate((1 9
|((: ;
AttributeTargets)) 
.)) 
Field)) 
,)) 
AllowMultiple)) )
=))* +
false)), 1
,))1 2
	Inherited))3 <
=))= >
true))? C
)))C D
]))D E
public** 
sealed**	 
class** 
NotNullAttribute** &
:**' (
	Attribute**) 2
{**3 4
}**5 6
[88 
AttributeUsage88 
(88 
AttributeTargets99 
.99 
Constructor99  
|99! "
AttributeTargets99# 3
.993 4
Method994 :
,99: ;
AllowMultiple:: 
=:: 
false:: 
,:: 
	Inherited:: $
=::% &
true::' +
)::+ ,
]::, -
public;; 
sealed;;	 
class;; '
StringFormatMethodAttribute;; 1
:;;2 3
	Attribute;;4 =
{<< 
public@@ 
'
StringFormatMethodAttribute@@ &
(@@& '
string@@' -
formatParameterName@@. A
)@@A B
{AA 
FormatParameterNameBB 
=BB 
formatParameterNameBB /
;BB/ 0
}CC 
publicEE 

stringEE 
FormatParameterNameEE %
{EE& '
getEE( +
;EE+ ,
privateEE- 4
setEE5 8
;EE8 9
}EE: ;
}FF 
[SS 
AttributeUsageSS 
(SS 
AttributeTargetsSS "
.SS" #
	ParameterSS# ,
,SS, -
AllowMultipleSS. ;
=SS< =
falseSS> C
,SSC D
	InheritedSSE N
=SSO P
trueSSQ U
)SSU V
]SSV W
publicTT 
sealedTT	 
classTT )
InvokerParameterNameAttributeTT 3
:TT4 5
	AttributeTT6 ?
{TT@ A
}TTB C
[zz 
AttributeUsagezz 
(zz 
AttributeTargetszz "
.zz" #
Methodzz# )
,zz) *
AllowMultiplezz+ 8
=zz9 :
falsezz; @
,zz@ A
	InheritedzzB K
=zzL M
truezzN R
)zzR S
]zzS T
public{{ 
sealed{{	 
class{{ 3
'NotifyPropertyChangedInvocatorAttribute{{ =
:{{> ?
	Attribute{{@ I
{|| 
public}} 
3
'NotifyPropertyChangedInvocatorAttribute}} 2
(}}2 3
)}}3 4
{}}5 6
}}}7 8
public~~ 
3
'NotifyPropertyChangedInvocatorAttribute~~ 2
(~~2 3
string~~3 9
parameterName~~: G
)~~G H
{ 
ParameterName
�� 
=
�� 
parameterName
�� #
;
��# $
}
�� 
public
�� 

string
�� 
ParameterName
�� 
{
��  !
get
��" %
;
��% &
private
��' .
set
��/ 2
;
��2 3
}
��4 5
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
Method
��# )
,
��) *
AllowMultiple
��+ 8
=
��9 :
true
��; ?
,
��? @
	Inherited
��A J
=
��K L
true
��M Q
)
��Q R
]
��R S
public
�� 
sealed
��	 
class
�� )
ContractAnnotationAttribute
�� 1
:
��2 3
	Attribute
��4 =
{
�� 
public
�� 
)
ContractAnnotationAttribute
�� &
(
��& '
[
��' (
NotNull
��( /
]
��/ 0
string
��1 7
contract
��8 @
)
��@ A
:
�� 
this
�� 
(
�� 
contract
�� 
,
�� 
false
�� 
)
�� 
{
�� 
}
��  !
public
�� 
)
ContractAnnotationAttribute
�� &
(
��& '
[
��' (
NotNull
��( /
]
��/ 0
string
��1 7
contract
��8 @
,
��@ A
bool
��B F
forceFullStates
��G V
)
��V W
{
�� 
Contract
�� 
=
�� 
contract
�� 
;
�� 
ForceFullStates
�� 
=
�� 
forceFullStates
�� '
;
��' (
}
�� 
public
�� 

string
�� 
Contract
�� 
{
�� 
get
��  
;
��  !
private
��" )
set
��* -
;
��- .
}
��/ 0
public
�� 

bool
�� 
ForceFullStates
�� 
{
��  !
get
��" %
;
��% &
private
��' .
set
��/ 2
;
��2 3
}
��4 5
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
All
��# &
,
��& '
AllowMultiple
��( 5
=
��6 7
false
��8 =
,
��= >
	Inherited
��? H
=
��I J
true
��K O
)
��O P
]
��P Q
public
�� 
sealed
��	 
class
�� +
LocalizationRequiredAttribute
�� 3
:
��4 5
	Attribute
��6 ?
{
�� 
public
�� 
+
LocalizationRequiredAttribute
�� (
(
��( )
)
��) *
:
��+ ,
this
��- 1
(
��1 2
true
��2 6
)
��6 7
{
��8 9
}
��: ;
public
�� 
+
LocalizationRequiredAttribute
�� (
(
��( )
bool
��) -
required
��. 6
)
��6 7
{
�� 
Required
�� 
=
�� 
required
�� 
;
�� 
}
�� 
public
�� 

bool
�� 
Required
�� 
{
�� 
get
�� 
;
�� 
private
��  '
set
��( +
;
��+ ,
}
��- .
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� 
.
�� 
	Interface
�� 
|
��  
AttributeTargets
��! 1
.
��1 2
Class
��2 7
|
��8 9
AttributeTargets
�� 
.
�� 
Struct
�� 
,
�� 
AllowMultiple
�� *
=
��+ ,
false
��- 2
,
��2 3
	Inherited
��4 =
=
��> ?
true
��@ D
)
��D E
]
��E F
public
�� 
sealed
��	 
class
�� 2
$CannotApplyEqualityOperatorAttribute
�� :
:
��; <
	Attribute
��= F
{
��G H
}
��I J
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
Class
��# (
,
��( )
AllowMultiple
��* 7
=
��8 9
true
��: >
,
��> ?
	Inherited
��@ I
=
��J K
true
��L P
)
��P Q
]
��Q R
[
�� 
BaseTypeRequired
�� 
(
�� 
typeof
�� 
(
�� 
	Attribute
�� $
)
��$ %
)
��% &
]
��& '
public
�� 
sealed
��	 
class
�� '
BaseTypeRequiredAttribute
�� /
:
��0 1
	Attribute
��2 ;
{
�� 
public
�� 
'
BaseTypeRequiredAttribute
�� $
(
��$ %
[
��% &
NotNull
��& -
]
��- .
Type
��/ 3
baseType
��4 <
)
��< =
{
�� 
BaseType
�� 
=
�� 
baseType
�� 
;
�� 
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
Type
�� 
BaseType
�� "
{
��# $
get
��% (
;
��( )
private
��* 1
set
��2 5
;
��5 6
}
��7 8
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
All
��# &
,
��& '
AllowMultiple
��( 5
=
��6 7
false
��8 =
,
��= >
	Inherited
��? H
=
��I J
true
��K O
)
��O P
]
��P Q
public
�� 
sealed
��	 
class
�� %
UsedImplicitlyAttribute
�� -
:
��. /
	Attribute
��0 9
{
�� 
public
�� 
%
UsedImplicitlyAttribute
�� "
(
��" #
)
��# $
:
�� 
this
�� 
(
�� "
ImplicitUseKindFlags
�� !
.
��! "
Default
��" )
,
��) *$
ImplicitUseTargetFlags
��+ A
.
��A B
Default
��B I
)
��I J
{
��K L
}
��M N
public
�� 
%
UsedImplicitlyAttribute
�� "
(
��" #"
ImplicitUseKindFlags
��# 7
useKindFlags
��8 D
)
��D E
:
�� 
this
�� 
(
�� 
useKindFlags
�� 
,
�� $
ImplicitUseTargetFlags
�� 1
.
��1 2
Default
��2 9
)
��9 :
{
��; <
}
��= >
public
�� 
%
UsedImplicitlyAttribute
�� "
(
��" #$
ImplicitUseTargetFlags
��# 9
targetFlags
��: E
)
��E F
:
�� 
this
�� 
(
�� "
ImplicitUseKindFlags
�� !
.
��! "
Default
��" )
,
��) *
targetFlags
��+ 6
)
��6 7
{
��8 9
}
��: ;
public
�� 
%
UsedImplicitlyAttribute
�� "
(
��" #"
ImplicitUseKindFlags
�� 
useKindFlags
�� '
,
��' ($
ImplicitUseTargetFlags
��) ?
targetFlags
��@ K
)
��K L
{
�� 
UseKindFlags
�� 
=
�� 
useKindFlags
�� !
;
��! "
TargetFlags
�� 
=
�� 
targetFlags
�� 
;
��  
}
�� 
public
�� 
"
ImplicitUseKindFlags
�� 
UseKindFlags
��  ,
{
��- .
get
��/ 2
;
��2 3
private
��4 ;
set
��< ?
;
��? @
}
��A B
public
�� 
$
ImplicitUseTargetFlags
�� !
TargetFlags
��" -
{
��. /
get
��0 3
;
��3 4
private
��5 <
set
��= @
;
��@ A
}
��B C
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
Class
��# (
,
��( )
AllowMultiple
��* 7
=
��8 9
false
��: ?
,
��? @
	Inherited
��A J
=
��K L
true
��M Q
)
��Q R
]
��R S
public
�� 
sealed
��	 
class
�� '
MeansImplicitUseAttribute
�� /
:
��0 1
	Attribute
��2 ;
{
�� 
public
�� 
'
MeansImplicitUseAttribute
�� $
(
��$ %
)
��% &
:
�� 
this
�� 
(
�� "
ImplicitUseKindFlags
�� !
.
��! "
Default
��" )
,
��) *$
ImplicitUseTargetFlags
��+ A
.
��A B
Default
��B I
)
��I J
{
��K L
}
��M N
public
�� 
'
MeansImplicitUseAttribute
�� $
(
��$ %"
ImplicitUseKindFlags
��% 9
useKindFlags
��: F
)
��F G
:
�� 
this
�� 
(
�� 
useKindFlags
�� 
,
�� $
ImplicitUseTargetFlags
�� 1
.
��1 2
Default
��2 9
)
��9 :
{
��; <
}
��= >
public
�� 
'
MeansImplicitUseAttribute
�� $
(
��$ %$
ImplicitUseTargetFlags
��% ;
targetFlags
��< G
)
��G H
:
�� 
this
�� 
(
�� "
ImplicitUseKindFlags
�� !
.
��! "
Default
��" )
,
��) *
targetFlags
��+ 6
)
��6 7
{
��8 9
}
��: ;
public
�� 
'
MeansImplicitUseAttribute
�� $
(
��$ %"
ImplicitUseKindFlags
�� 
useKindFlags
�� '
,
��' ($
ImplicitUseTargetFlags
��) ?
targetFlags
��@ K
)
��K L
{
�� 
UseKindFlags
�� 
=
�� 
useKindFlags
�� !
;
��! "
TargetFlags
�� 
=
�� 
targetFlags
�� 
;
��  
}
�� 
[
�� 
UsedImplicitly
�� 
]
�� 
public
�� "
ImplicitUseKindFlags
�� 0
UseKindFlags
��1 =
{
��> ?
get
��@ C
;
��C D
private
��E L
set
��M P
;
��P Q
}
��R S
[
�� 
UsedImplicitly
�� 
]
�� 
public
�� $
ImplicitUseTargetFlags
�� 2
TargetFlags
��3 >
{
��? @
get
��A D
;
��D E
private
��F M
set
��N Q
;
��Q R
}
��S T
}
�� 
[
�� 
Flags
�� 
]
�� 	
public
�� 
enum
��	 "
ImplicitUseKindFlags
�� "
{
�� 
Default
�� 
=
�� 
Access
�� 
|
�� 
Assign
�� 
|
�� 7
)InstantiatedWithFixedConstructorSignature
��  I
,
��I J
Access
�� 

=
�� 
$num
�� 
,
�� 
Assign
�� 

=
�� 
$num
�� 
,
�� 7
)InstantiatedWithFixedConstructorSignature
�� -
=
��. /
$num
��0 1
,
��1 25
'InstantiatedNoFixedConstructorSignature
�� +
=
��, -
$num
��. /
,
��/ 0
}
�� 
[
�� 
Flags
�� 
]
�� 	
public
�� 
enum
��	 $
ImplicitUseTargetFlags
�� $
{
�� 
Default
�� 
=
�� 
Itself
�� 
,
�� 
Itself
�� 

=
�� 
$num
�� 
,
�� 
Members
�� 
=
�� 
$num
�� 
,
�� 
WithMembers
�� 
=
�� 
Itself
�� 
|
�� 
Members
�� "
}
�� 
[
�� 
MeansImplicitUse
�� 
]
�� 
public
�� 
sealed
��	 
class
��  
PublicAPIAttribute
�� (
:
��) *
	Attribute
��+ 4
{
�� 
public
�� 
 
PublicAPIAttribute
�� 
(
�� 
)
�� 
{
��  !
}
��" #
public
�� 
 
PublicAPIAttribute
�� 
(
�� 
[
�� 
NotNull
�� &
]
��& '
string
��( .
comment
��/ 6
)
��6 7
{
�� 
Comment
�� 
=
�� 
comment
�� 
;
�� 
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
string
�� 
Comment
�� #
{
��$ %
get
��& )
;
��) *
private
��+ 2
set
��3 6
;
��6 7
}
��8 9
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
,
��, -
	Inherited
��. 7
=
��8 9
true
��: >
)
��> ?
]
��? @
public
�� 
sealed
��	 
class
�� $
InstantHandleAttribute
�� ,
:
��- .
	Attribute
��/ 8
{
��9 :
}
��; <
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
Method
��# )
,
��) *
	Inherited
��+ 4
=
��5 6
true
��7 ;
)
��; <
]
��< =
public
�� 
sealed
��	 
class
�� 
PureAttribute
�� #
:
��$ %
	Attribute
��& /
{
��0 1
}
��2 3
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
)
��, -
]
��- .
public
�� 
class
��	 $
PathReferenceAttribute
�� %
:
��& '
	Attribute
��( 1
{
�� 
public
�� 
$
PathReferenceAttribute
�� !
(
��! "
)
��" #
{
��$ %
}
��& '
public
�� 
$
PathReferenceAttribute
�� !
(
��! "
[
��" #
PathReference
��# 0
]
��0 1
string
��2 8
basePath
��9 A
)
��A B
{
�� 
BasePath
�� 
=
�� 
basePath
�� 
;
�� 
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
string
�� 
BasePath
�� $
{
��% &
get
��' *
;
��* +
private
��, 3
set
��4 7
;
��7 8
}
��9 :
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
|
��- .
AttributeTargets
��/ ?
.
��? @
Method
��@ F
)
��F G
]
��G H
public
�� 
sealed
��	 
class
�� #
AspMvcActionAttribute
�� +
:
��, -
	Attribute
��. 7
{
�� 
public
�� 
#
AspMvcActionAttribute
��  
(
��  !
)
��! "
{
��# $
}
��% &
public
�� 
#
AspMvcActionAttribute
��  
(
��  !
[
��! "
NotNull
��" )
]
��) *
string
��+ 1
anonymousProperty
��2 C
)
��C D
{
�� 
AnonymousProperty
�� 
=
�� 
anonymousProperty
�� +
;
��+ ,
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
string
�� 
AnonymousProperty
�� -
{
��. /
get
��0 3
;
��3 4
private
��5 <
set
��= @
;
��@ A
}
��B C
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
)
��, -
]
��- .
public
�� 
sealed
��	 
class
�� !
AspMvcAreaAttribute
�� )
:
��* +$
PathReferenceAttribute
��, B
{
�� 
public
�� 
!
AspMvcAreaAttribute
�� 
(
�� 
)
��  
{
��! "
}
��# $
public
�� 
!
AspMvcAreaAttribute
�� 
(
�� 
[
��  
NotNull
��  '
]
��' (
string
��) /
anonymousProperty
��0 A
)
��A B
{
�� 
AnonymousProperty
�� 
=
�� 
anonymousProperty
�� +
;
��+ ,
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
string
�� 
AnonymousProperty
�� -
{
��. /
get
��0 3
;
��3 4
private
��5 <
set
��= @
;
��@ A
}
��B C
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
|
��- .
AttributeTargets
��/ ?
.
��? @
Method
��@ F
)
��F G
]
��G H
public
�� 
sealed
��	 
class
�� '
AspMvcControllerAttribute
�� /
:
��0 1
	Attribute
��2 ;
{
�� 
public
�� 
'
AspMvcControllerAttribute
�� $
(
��$ %
)
��% &
{
��' (
}
��) *
public
�� 
'
AspMvcControllerAttribute
�� $
(
��$ %
[
��% &
NotNull
��& -
]
��- .
string
��/ 5
anonymousProperty
��6 G
)
��G H
{
�� 
AnonymousProperty
�� 
=
�� 
anonymousProperty
�� +
;
��+ ,
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
string
�� 
AnonymousProperty
�� -
{
��. /
get
��0 3
;
��3 4
private
��5 <
set
��= @
;
��@ A
}
��B C
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
)
��, -
]
��- .
public
�� 
sealed
��	 
class
�� #
AspMvcMasterAttribute
�� +
:
��, -
	Attribute
��. 7
{
��8 9
}
��: ;
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
)
��, -
]
��- .
public
�� 
sealed
��	 
class
�� &
AspMvcModelTypeAttribute
�� .
:
��/ 0
	Attribute
��1 :
{
��; <
}
��= >
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
|
��- .
AttributeTargets
��/ ?
.
��? @
Method
��@ F
)
��F G
]
��G H
public
�� 
sealed
��	 
class
�� (
AspMvcPartialViewAttribute
�� 0
:
��1 2$
PathReferenceAttribute
��3 I
{
��J K
}
��L M
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
Class
��# (
|
��) *
AttributeTargets
��+ ;
.
��; <
Method
��< B
)
��B C
]
��C D
public
�� 
sealed
��	 
class
�� -
AspMvcSupressViewErrorAttribute
�� 5
:
��6 7
	Attribute
��8 A
{
��B C
}
��D E
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
)
��, -
]
��- .
public
�� 
sealed
��	 
class
�� ,
AspMvcDisplayTemplateAttribute
�� 4
:
��5 6
	Attribute
��7 @
{
��A B
}
��C D
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
)
��, -
]
��- .
public
�� 
sealed
��	 
class
�� +
AspMvcEditorTemplateAttribute
�� 3
:
��4 5
	Attribute
��6 ?
{
��@ A
}
��B C
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
)
��, -
]
��- .
public
�� 
sealed
��	 
class
�� %
AspMvcTemplateAttribute
�� -
:
��. /
	Attribute
��0 9
{
��: ;
}
��< =
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
|
��- .
AttributeTargets
��/ ?
.
��? @
Method
��@ F
)
��F G
]
��G H
public
�� 
sealed
��	 
class
�� !
AspMvcViewAttribute
�� )
:
��* +$
PathReferenceAttribute
��, B
{
��C D
}
��E F
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
|
��- .
AttributeTargets
��/ ?
.
��? @
Property
��@ H
)
��H I
]
��I J
public
�� 
sealed
��	 
class
�� +
AspMvcActionSelectorAttribute
�� 3
:
��4 5
	Attribute
��6 ?
{
��@ A
}
��B C
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� 
.
�� 
	Parameter
�� 
|
��  
AttributeTargets
��! 1
.
��1 2
Property
��2 :
|
��; <
AttributeTargets
�� 
.
�� 
Field
�� 
,
�� 
	Inherited
�� %
=
��& '
true
��( ,
)
��, -
]
��- .
public
�� 
sealed
��	 
class
�� ,
HtmlElementAttributesAttribute
�� 4
:
��5 6
	Attribute
��7 @
{
�� 
public
�� 
,
HtmlElementAttributesAttribute
�� )
(
��) *
)
��* +
{
��, -
}
��. /
public
�� 
,
HtmlElementAttributesAttribute
�� )
(
��) *
[
��* +
NotNull
��+ 2
]
��2 3
string
��4 :
name
��; ?
)
��? @
{
�� 
Name
�� 

=
�� 
name
�� 
;
�� 
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
string
�� 
Name
��  
{
��! "
get
��# &
;
��& '
private
��( /
set
��0 3
;
��3 4
}
��5 6
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� 
.
�� 
	Parameter
�� 
|
��  
AttributeTargets
��! 1
.
��1 2
Field
��2 7
|
��8 9
AttributeTargets
�� 
.
�� 
Property
�� 
,
�� 
	Inherited
�� (
=
��) *
true
��+ /
)
��/ 0
]
��0 1
public
�� 
sealed
��	 
class
�� )
HtmlAttributeValueAttribute
�� 1
:
��2 3
	Attribute
��4 =
{
�� 
public
�� 
)
HtmlAttributeValueAttribute
�� &
(
��& '
[
��' (
NotNull
��( /
]
��/ 0
string
��1 7
name
��8 <
)
��< =
{
�� 
Name
�� 

=
�� 
name
�� 
;
�� 
}
�� 
[
�� 
NotNull
�� 
]
�� 
public
�� 
string
�� 
Name
��  
{
��! "
get
��# &
;
��& '
private
��( /
set
��0 3
;
��3 4
}
��5 6
}
�� 
[
�� 
AttributeUsage
�� 
(
�� 
AttributeTargets
�� "
.
��" #
	Parameter
��# ,
|
��- .
AttributeTargets
��/ ?
.
��? @
Method
��@ F
,
��F G
	Inherited
��H Q
=
��R S
true
��T X
)
��X Y
]
��Y Z
public
�� 
sealed
��	 
class
�� #
RazorSectionAttribute
�� +
:
��, -
	Attribute
��. 7
{
��8 9
}
��: ;
}�� �
MC:\working\spam-vsts\src\Battleship.GameController\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str 4
)4 5
]5 6
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str 6
)6 7
]7 8
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
[## 
assembly## 	
:##	 

AssemblyVersion## 
(## 
$str## $
)##$ %
]##% &
[$$ 
assembly$$ 	
:$$	 

AssemblyFileVersion$$ 
($$ 
$str$$ (
)$$( )
]$$) *�
IC:\working\spam-vsts\src\Battleship.GameController\Events\ShipHitEvent.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Events$ *
{ 
public 

class 
ShipHitEvent 
: 
IRequest  (
<( )
EventAck) 1
>1 2
{ 
public 
Position 
Position  
{! "
get# &
;& '
}( )
public		 
ShipHitEvent		 
(		 
Position		 $
position		% -
)		- .
{

 	
Position 
= 
position 
;  
} 	
} 
} �
MC:\working\spam-vsts\src\Battleship.GameController\Queries\UserPromptQuery.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Queries$ +
{ 
public 

class 
UserPromptQuery  
:! "
IRequest# +
<+ ,
string, 2
>2 3
{ 
public 
string 
Prompt 
{ 
get "
;" #
}$ %
public		 
UserPromptQuery		 
(		 
string		 %
prompt		& ,
)		, -
{

 	
Prompt 
= 
prompt 
; 
} 	
} 
} �
MC:\working\spam-vsts\src\Battleship.GameController\Commands\ShowHitCommand.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Commands$ ,
{ 
public 

class 
ShowHitCommand 
:  !
IRequest" *
<* +
EventAck+ 3
>3 4
{ 
public		 
ConsoleColor		 
Color		 !
{		" #
get		$ '
;		' (
}		) *
public

 
string

 
Message

 
{

 
get

  #
;

# $
}

% &
public 
ShowHitCommand 
( 
ConsoleColor *
color+ 0
,0 1
string2 8
message9 @
)@ A
{ 	
Color 
= 
color 
; 
Message 
= 
message 
; 
} 	
} 
} �
NC:\working\spam-vsts\src\Battleship.GameController\Commands\ShowMissCommand.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Commands$ ,
{ 
public 

class 
ShowMissCommand  
:! "
IRequest# +
<+ ,
EventAck, 4
>4 5
{ 
public 
ConsoleColor 
Color !
{" #
get$ '
;' (
}) *
public		 
string		 
Message		 
{		 
get		  #
;		# $
}		% &
public 
ShowMissCommand 
( 
ConsoleColor +
color, 1
,1 2
string3 9
message: A
)A B
{ 	
Color 
= 
color 
; 
Message 
= 
message 
; 
} 	
} 
} �
PC:\working\spam-vsts\src\Battleship.GameController\Commands\ShowCannonCommand.cs
	namespace 	

Battleship
 
. 
GameController #
.# $
Commands$ ,
{ 
public 

class 
ShowCannonCommand "
:# $
IRequest% -
<- .
EventAck. 6
>6 7
{ 
} 
} �&
JC:\working\spam-vsts\src\Battleship.GameController\ComputerAiController.cs
	namespace 	

Battleship
 
. 
GameController #
{ 
public 

class  
ComputerAiController %
{ 
public		 
void		 
InitializeFleet		 #
(		# $
Board		$ )
board		* /
)		/ 0
{

 	
var 
	fleetList 
= 
board !
.! "
Fleet" '
.' (
ToList( .
(. /
)/ 0
;0 1
foreach 
( 
Ship 
ship 
in !
	fleetList" +
)+ ,
{ 

Coordinate 
startingCoordinate -
=. /&
GetUntakenRandomCoordinate0 J
(J K
boardK P
)P Q
;Q R1
%PlaceShipCoordinatesForShipStartingAt 5
(5 6
startingCoordinate6 H
,H I
shipJ N
)N O
;O P
} 
foreach 
( 
Ship 
ship 
in !
board" '
.' (
Fleet( -
)- .
{ 
Console 
. 
	WriteLine !
(! "
ship" &
.& '
Name' +
)+ ,
;, -
foreach 
( 
Position !
position" *
in+ -
ship. 2
.2 3
	Positions3 <
)< =
{ 
Console 
. 
	WriteLine %
(% &
position& .
.. /

Coordinate/ 9
.9 :
Column: @
+A B
$strC F
+G H
positionI Q
.Q R

CoordinateR \
.\ ]
Row] `
)` a
;a b
} 
} 
} 	
private 
void 1
%PlaceShipCoordinatesForShipStartingAt :
(: ;

Coordinate; E
startingCoordinateF X
,X Y
Ship 
ship 
) 
{ 	
for   
(   
int   
i   
=   
$num   
;   
i   
<   
ship    $
.  $ %
Size  % )
;  ) *
i  + ,
++  , .
)  . /
{!! 
ship"" 
."" 
	Positions"" 
."" 
Add"" "
(""" #
new""# &
Position""' /
(""/ 0
startingCoordinate## &
.##& '
Column##' -
,##- .
startingCoordinate##/ A
.##A B
Row##B E
+##F G
i##H I
,##I J
ship##K O
)##O P
)##P Q
;##Q R
}$$ 
}** 	
private,, 

Coordinate,, &
GetUntakenRandomCoordinate,, 5
(,,5 6
Board,,6 ;
board,,< A
),,A B
{-- 	
do.. 
{// 

Coordinate00 
randomCoordinate00 +
=00, -"
ChooseRandomCoordinate00. D
(00D E
board00E J
)00J K
;00K L
if11 
(11 
!11 
board11 
.11 
IsShipAt11 #
(11# $
randomCoordinate11$ 4
)114 5
)115 6
return117 =
randomCoordinate11> N
;11N O
}22 
while22 
(22 
true22 
)22 
;22 
}33 	
public55 

Coordinate55 "
ChooseRandomCoordinate55 0
(550 1
Board551 6
board557 <
)55< =
{66 	
var77 
rows77 
=77 
board77 
.77 
Size77 !
;77! "
var88 
lines88 
=88 
board88 
.88 
Size88 "
;88" #
var99 
random99 
=99 
new99 
Random99 #
(99# $
)99$ %
;99% &
var:: 
letter:: 
=:: 
(:: 
Letters:: !
)::! "
random::" (
.::( )
Next::) -
(::- .
$num::. /
,::/ 0
lines::1 6
)::6 7
;::7 8
var;; 
number;; 
=;; 
random;; 
.;;  
Next;;  $
(;;$ %
$num;;% &
,;;& '
rows;;( ,
);;, -
;;;- .
var<< 

coordinate<< 
=<< 
new<<  

Coordinate<<! +
(<<+ ,
letter<<, 2
,<<2 3
number<<4 :
)<<: ;
;<<; <
return== 

coordinate== 
;== 
}>> 	
}?? 
}@@ 