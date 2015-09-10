 function ShowBoard ($a2 )
{

for($x=0; $x -le 2; $x++)

{

   for($y=0; $y -le 2; $y++)

    {

   if ($y -eq 0)

   {

    write-host -nonewline "|"
    
    }

    write-host -noNewline $a2[$x][$y]

    write-host -nonewline "|"

    }

write-host ""

}

 

}

 

function GetCoordinates

{

write-host 'gimme some input'

$xy = read-host

$xyArray = $xy.Split(',')


return $xyArray

}


 

 

function GetWinner ($a2, $player)
 {


 if 

(
$a2[0][0] -eq $player -and
$a2[0][1] -eq $player -and
$a2[0][2] -eq $player

)



 
{
   return $true 

}

 if 

(
$a2[1][0] -eq $player -and
$a2[1][1] -eq $player -and
$a2[1][2] -eq $player

)



 
{
   return $true 

}



if 

(
$a2[2][0] -eq $player -and
$a2[2][1] -eq $player -and
$a2[2][2] -eq $player

)



 
{
   return $true 

}




if 

(
$a2[0][0] -eq $player -and
$a2[1][0] -eq $player -and
$a2[2][0] -eq $player

)

 
{
   return $true 

}



if 

(
$a2[0][1] -eq $player -and
$a2[1][1] -eq $player -and
$a2[2][1] -eq $player

)

 
{
   return $true 

}


if 

(
$a2[0][2] -eq $player -and
$a2[1][2] -eq $player -and
$a2[2][2] -eq $player

)

 
{
   return $true 

}



if 

(
$a2[0][0] -eq $player -and
$a2[1][1] -eq $player -and
$a2[2][2] -eq $player

)

 
{
   return $true 

}




if 

(
$a2[0][2] -eq $player -and
$a2[1][1] -eq $player -and
$a2[2][0] -eq $player

)

 
{
   return $true 

}


return $false 


}

 
function PlayerMove ($a2, $xyArray)
{

write-host "Your move!"

$x = $xyArray[0]
$y = $xyArray[1]

if ($a2[$x][$y] -eq "*")
{
    $a2[$x][$y]="X"   

}

else
 {
  write-host "sorry buddy, bad coordinates, FOREFEIT !!!"
 }
}



function Tac ($a2)
{
for($x=0; $x -le 2; $x++)

{

   for($y=0; $y -le 2; $y++)

    {
          if ($a2[$x][$y] -eq "*")
            {
            $a2[$x][$y]= "0"
            return
            }

    }


}

 






}

#main

#******************************************
#******************************************

 $a2 =
@(
("*", "*", "*" ), 
("*", "*", "*" ), 
("*", "*", "*" )
)
ShowBoard $a2

while ($true)
{

   
    $xyArray = GetCoordinates
     
    
    PlayerMove $a2 $xyArray

    ShowBoard($a2)
  
    $playerWon= $(GetWinner $a2 "X")
   if ($playerWon)
    {
    write-host "Good Job Player, you won"
    break

    }

    write-host "My Move!"
  
   Tac $a2
  ShowBoard $a2
  
     $computerWon= $(GetWinner $a2 "0")
   if ($computerWon)
    {
    write-host "Sorry man, you lost, have a nice day. You are not a loser, you just lost. Just this time.  You are not a loser.  Really.  You are not. "
    break


    }

}
