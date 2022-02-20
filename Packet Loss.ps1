$regex = [regex]"\((.*)\)" 

$Ping = ping -n 100 8.8.8.8
$Loss = [regex]::match($Ping, $regex).Groups[1]
$Time = Get-Date
$Results = "$time 8.8.8.8 $Loss"
$Results | Out-File -Append -Encoding UTF8 C:\PacketLoss\8.8.8.8.txt

$Ping = ping -n 100 8.8.4.4
$Loss = [regex]::match($Ping, $regex).Groups[1]
$Time = Get-Date
$Results = "$time 8.8.4.4 $Loss"
$Results | Out-File -Append -Encoding UTF8 C:\PacketLoss\8.8.4.4.txt

$Ping = ping -n 100 1.1.1.1
$Loss = [regex]::match($Ping, $regex).Groups[1]
$Time = Get-Date
$Results = "$time 1.1.1.1 $Loss"
$Results | Out-File -Append -Encoding UTF8 C:\PacketLoss\1.1.1.1.txt

$Ping = ping -n 100 pool.ntp.org
$Loss = [regex]::match($Ping, $regex).Groups[1]
$Time = Get-Date
$Results = "$time pool.ntp.org $Loss"
$Results | Out-File -Append -Encoding UTF8 C:\PacketLoss\pool.ntp.org.txt