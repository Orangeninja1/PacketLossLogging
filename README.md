# PacketLossLogging
This Powershell script can monitor the amount of packet loss to desination addresses. This works by pinging the desitnation 100 times and recording the result. I am using this with Windows Scheduled Tasks to run as often as I need.

Addresses to test can be setup by adding "PacketLossTest -Destination "(Your destination)"" to the end of the script. The first time this script is ran it will create a text document with the packet loss results. Additional runs will add the results to the end of the file. Each destination will have its own text document.
