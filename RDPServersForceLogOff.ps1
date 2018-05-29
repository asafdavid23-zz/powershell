Import-module PSTerminalServices

$LogTime = Get-Date -Format "dd/MM/yyyy:hh:mm"
$LogPath = "c:\RDPServersForceLogOff\Log\log.txt"
$servers = Import-Csv C:\RDPServersForceLogOff\INServerList.csv
$arrayserverlist = New-Object System.Collections.ArrayList
$arrayserverlist.Clear()

    
  foreach ($server in $servers) {
           
           if ($server.ServerNetwork -eq "IN") {
              $arrayserverlist.Add((Get-TSSession -ComputerName $server.ServerName -State Disconnected | Where-Object {$_.SessionId -ne 0})) 
              Get-TSSession -ComputerName $server.ServerName -State Disconnected  | Where-Object {$_.SessionId -ne 0} | Stop-TSSession -Force
           }

       Write-Output $arrayserverlist > $LogPath      
   }

Get-TSSession -ComputerName $server.ServerName -State Disconnected  | Where-Object {$_.SessionId -ne 0}
     
[System.Windows.Forms.MessageBox]::Show("All RDP disconnected sessions, are loged off now.", "Information" , 0)