$regex = [regex]"\((.*)\)" 

$Ping = ping -n 10 8.8.8.8
$Loss = [regex]::match($Ping, $regex).Groups[1]
$Time = Get-Date
$Results = "$time 8.8.8.8 $Loss"
$Results | Out-File -Append -Encoding UTF8 8.8.8.8.txt

$Ping = ping -n 10 8.8.4.4
$Loss = [regex]::match($Ping, $regex).Groups[1]
$Time = Get-Date
$Results = "$time 8.8.4.4 $Loss"
$Results | Out-File -Append -Encoding UTF8 8.8.4.4.txt