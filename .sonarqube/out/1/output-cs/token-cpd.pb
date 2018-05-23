ß
DC:\working\spam-vsts\src\Battleship.Ascii\GameAnnouncementHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class #
GameAnnouncementHandler (
:) *
IRequestHandler+ :
<: ;!
GameAnnouncementEvent; P
,P Q
EventAckR Z
>Z [
{		 
public

 
EventAck

 
Handle

 
(

 !
GameAnnouncementEvent

 4
request

5 <
)

< =
{ 	
Console 
. 
	WriteLine 
( 
$str >
,> ?
request@ G
.G H
MessageH O
)O P
;P Q
Console 
. 
	WriteLine 
( 
) 
;  
return 
EventAck 
. 
Ok 
; 
} 	
} 
} ‰

4C:\working\spam-vsts\src\Battleship.Ascii\Program.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
internal 
class 
Program 
{ 
private 
static 
	Container  
iocContainer! -
;- .
private		 
static		 
Bus		 
_bus		 
;		  
public 
static 
void 
Main 
(  
)  !
{ 	
iocContainer 
= 
new 
	Container (
(( )
new) , 
StructureMapRegistry- A
(A B
)B C
)C D
;D E
_bus 
= 
iocContainer 
.  
GetInstance  +
<+ ,
Bus, /
>/ 0
(0 1
)1 2
;2 3
var 

controller 
= 
new  
GameController! /
./ 0
GameController0 >
(> ?
_bus? C
)C D
;D E

controller 
. 
Run 
( 
) 
; 
} 	
} 
} €
DC:\working\spam-vsts\src\Battleship.Ascii\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str -
)- .
]. /
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
$str /
)/ 0
]0 1
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
]$$) *
[&& 
assembly&& 	
:&&	 

InternalsVisibleTo&& 
(&& 
$str&& 6
)&&6 7
]&&7 8‘
;C:\working\spam-vsts\src\Battleship.Ascii\ShipHitHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class 
ShipHitHandler 
:  !
IRequestHandler" 1
<1 2
ShipHitEvent2 >
,> ?
EventAck@ H
>H I
{		 
public

 
EventAck

 
Handle

 
(

 
ShipHitEvent

 +
request

, 3
)

3 4
{ 	
return 
EventAck 
. 
Ok 
; 
} 	
} 
} ÷
>C:\working\spam-vsts\src\Battleship.Ascii\ShowCannonHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class 
ShowCannonHandler "
:# $
IRequestHandler% 4
<4 5
ShowCannonCommand5 F
,F G
EventAckH P
>P Q
{		 
public

 
EventAck

 
Handle

 
(

 
ShowCannonCommand

 0
request

1 8
)

8 9
{ 	
Console 
. 
	WriteLine 
( 
$str L
)L M
;M N
Console 
. 
	WriteLine 
( 
$str L
)L M
;M N
Console 
. 
	WriteLine 
( 
$str L
)L M
;M N
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
$str K
)K L
;L M
Console 
. 
	WriteLine 
( 
$str K
)K L
;L M
Console 
. 
	WriteLine 
( 
$str K
)K L
;L M
return 
EventAck 
. 
Ok 
; 
} 	
} 
} Å	
<C:\working\spam-vsts\src\Battleship.Ascii\ShowMissHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class 
ShowMissHandler  
:! "
IRequestHandler# 2
<2 3
ShowMissCommand3 B
,B C
EventAckD L
>L M
{		 
public

 
EventAck

 
Handle

 
(

 
ShowMissCommand

 .
request

/ 6
)

6 7
{ 	
var 
color 
= 
Console 
.  
ForegroundColor  /
;/ 0
Console 
. 
ForegroundColor #
=$ %
request& -
.- .
Color. 3
;3 4
Console 
. 
	WriteLine 
( 
request %
.% &
Message& -
)- .
;. /
Console 
. 
ForegroundColor #
=$ %
color& +
;+ ,
return 
EventAck 
. 
Ok 
; 
} 	
} 
} š
;C:\working\spam-vsts\src\Battleship.Ascii\ShowHitHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class 
ShowHitHandler 
:  !
IRequestHandler" 1
<1 2
ShowHitCommand2 @
,@ A
EventAckB J
>J K
{		 
public

 
EventAck

 
Handle

 
(

 
ShowHitCommand

 -
request

. 5
)

5 6
{ 	
Console 
. 
Beep 
( 
) 
; 
var 
	origColor 
= 
Console #
.# $
ForegroundColor$ 3
;3 4
Console 
. 
ForegroundColor #
=$ %
request& -
.- .
Color. 3
;3 4
Console 
. 
	WriteLine 
( 
$str /
)/ 0
;0 1
Console 
. 
	WriteLine 
( 
$str /
)/ 0
;0 1
Console 
. 
	WriteLine 
( 
$str /
)/ 0
;0 1
Console 
. 
	WriteLine 
( 
request %
.% &
Message& -
)- .
;. /
Console 
. 
ForegroundColor #
=$ %
	origColor& /
;/ 0
return 
EventAck 
. 
Ok 
; 
} 	
} 
} €
<C:\working\spam-vsts\src\Battleship.Ascii\ShowSunkHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class 
ShowSunkHandler  
:! "
IRequestHandler# 2
<2 3
ShowSunkCommand3 B
,B C
EventAckD L
>L M
{		 
public

 
EventAck

 
Handle

 
(

 
ShowSunkCommand

 .
request

/ 6
)

6 7
{ 	
Console 
. 
Beep 
( 
) 
; 
var 
	origColor 
= 
Console #
.# $
ForegroundColor$ 3
;3 4
Console 
. 
ForegroundColor #
=$ %
request& -
.- .
Color. 3
;3 4
Console 
. 
	WriteLine 
( 
$str @
)@ A
;A B
Console 
. 
	WriteLine 
( 
$str F
)F G
;G H
Console 
. 
	WriteLine 
( 
$str B
)B C
;C D
Console 
. 
	WriteLine 
( 
$str E
)E F
;F G
Console 
. 
	WriteLine 
( 
$str C
)C D
;D E
Console 
. 
	WriteLine 
( 
$str E
)E F
;F G
Console 
. 
	WriteLine 
( 
$str A
)A B
;B C
Console 
. 
	WriteLine 
( 
$str ?
)? @
;@ A
Console 
. 
	WriteLine 
( 
request %
.% &
Message& -
)- .
;. /
Console 
. 
ForegroundColor #
=$ %
	origColor& /
;/ 0
return 
EventAck 
. 
Ok 
; 
} 	
} 
} ½
AC:\working\spam-vsts\src\Battleship.Ascii\StructureMapRegistry.cs
	namespace 	

Battleship
 
. 
Ascii 
{		 
public

 

class

  
StructureMapRegistry

 %
:

& '
Registry

( 0
{ 
public  
StructureMapRegistry #
(# $
)$ %
{ 	
Scan 
( 
scanner 
=> 
{ 
scanner 
. "
AssemblyContainingType .
<. /
Program/ 6
>6 7
(7 8
)8 9
;9 :
scanner 
. "
AssemblyContainingType .
<. /
Ship/ 3
>3 4
(4 5
)5 6
;6 7
scanner 
. "
WithDefaultConventions .
(. /
)/ 0
;0 1
scanner 
. 0
$ConnectImplementationsToTypesClosing <
(< =
typeof= C
(C D
IRequestHandlerD S
<S T
,T U
>U V
)V W
)W X
;X Y
} 
) 
; 
For 
< !
SingleInstanceFactory %
>% &
(& '
)' (
.( )
Use) ,
<, -!
SingleInstanceFactory- B
>B C
(C D
ctxD G
=>H J
tK L
=>M O
GetInstanceP [
([ \
ctx\ _
,_ `
ta b
)b c
)c d
;d e
For 
<  
MultiInstanceFactory $
>$ %
(% &
)& '
.' (
Use( +
<+ , 
MultiInstanceFactory, @
>@ A
(A B
ctxB E
=>F H
tI J
=>K M
GetAllInstancesN ]
(] ^
ctx^ a
,a b
tc d
)d e
)e f
;f g
} 	
private 
static 
IEnumerable "
<" #
object# )
>) *
GetAllInstances+ :
(: ;
IContext; C
ctxD G
,G H
TypeI M
tN O
)O P
{ 	
var 
allInstances 
= 
ctx "
." #
GetAllInstances# 2
(2 3
t3 4
)4 5
;5 6
return 
allInstances 
;  
} 	
private 
static 
object 
GetInstance )
() *
IContext* 2
ctx3 6
,6 7
Type8 <
t= >
)> ?
{   	
return!! 
ctx!! 
.!! 
GetInstance!! "
(!!" #
t!!# $
)!!$ %
;!!% &
}"" 	
}## 
}$$ ®
?C:\working\spam-vsts\src\Battleship.Ascii\UserMessageHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class 
UserMessageHandler #
:$ %
IRequestHandler& 5
<5 6
UserMessageCommand6 H
,H I
EventAckJ R
>R S
{		 
public

 
EventAck

 
Handle

 
(

 
UserMessageCommand

 1
request

2 9
)

9 :
{ 	
Console 
. 
	WriteLine 
( 
request %
.% &
Message& -
)- .
;. /
Console 
. 
	WriteLine 
( 
) 
;  
return 
EventAck 
. 
Ok 
; 
} 	
} 
} ·
>C:\working\spam-vsts\src\Battleship.Ascii\UserPromptHandler.cs
	namespace 	

Battleship
 
. 
Ascii 
{ 
public 

class 
UserPromptHandler "
:# $
IRequestHandler% 4
<4 5
UserPromptQuery5 D
,D E
stringF L
>L M
{ 
public		 
string		 
Handle		 
(		 
UserPromptQuery		 ,
request		- 4
)		4 5
{

 	
Console 
. 
	WriteLine 
( 
request %
.% &
Prompt& ,
), -
;- .
var 
readLine 
= 
Console "
." #
ReadLine# +
(+ ,
), -
;- .
return 
readLine 
; 
} 	
} 
} 