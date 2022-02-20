$OutputDirectory = "C:\PacketLoss\"
$regex = [regex]"\((.*)\)" 

function PacketLossTest
{
	param($Destination)
	$Ping = ping -n 100 "$Destination"
	$Loss = [regex]::match($Ping, $regex).Groups[1]
	$Time = Get-Date
	$Results = "$time $Destination $Loss"
	$Results | Out-File -Append -Encoding UTF8 $OutputDirectory$Destination.txt
}

PacketLossTest -Destination "8.8.8.8"
PacketLossTest -Destination "8.8.4.4"
PacketLossTest -Destination "1.1.1.1"
PacketLossTest -Destination "wikipedia.org"
