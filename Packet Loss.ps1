$OutputDirectory = "C:\PacketLoss\"
$NumberOfPings = 100
$regex = [regex]"\((.*)\)" 

function PacketLossTest
{
	param($Destination)
	$Ping = ping -n $NumberOfPings "$Destination"
	$Loss = [regex]::match($Ping, $regex).Groups[1]
	$Time = Get-Date
	$Results = "$time $Destination $Loss"
	$Results | Out-File -Append -Encoding UTF8 $OutputDirectory$Destination.txt
}

function PacketLossTestCSV
{
	param($Destination)
	$Ping = ping -n $NumberOfPings "$Destination"
	$Loss = [regex]::match($Ping, $regex).Groups[1]
	$Time = Get-Date
	$CSVResults = [ordered]@{ 
            'Time'= $Time;
            'Destination'= $Destination;
            'Packet Loss' = $Loss}
	$CSVOutput = New-Object -TypeName PSObject -Property $CSVResults
	$CSVOutput | Export-Csv -path $OutputDirectory$Destination.csv -append
}

function PacketLossTestTXTandCSV
{
	param($Destination)
	$Ping = ping -n $NumberOfPings "$Destination"
	$Loss = [regex]::match($Ping, $regex).Groups[1]
	$Time = Get-Date
	$Results = "$time $Destination $Loss"
	$Results | Out-File -Append -Encoding UTF8 $OutputDirectory$Destination.txt
	$CSVResults = [ordered]@{ 
            'Time'= $Time;
            'Destination'= $Destination;
            'Packet Loss' = $Loss}
	$CSVOutput = New-Object -TypeName PSObject -Property $CSVResults
	$CSVOutput | Export-Csv -path $OutputDirectory$Destination.csv -append
}

PacketLossTestTXTandCSV -Destination "8.8.8.8"
PacketLossTestTXTandCSV -Destination "8.8.4.4"
PacketLossTestTXTandCSV -Destination "1.1.1.1"
PacketLossTestTXTandCSV -Destination "wikipedia.org"
