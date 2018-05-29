Set-ExecutionPolicy Unrestricted
Import-module PSTerminalServices

$LogTime = Get-Date -Format "dd/MM/yyyy:hh:mm"
$LogPath = "c:\RDPServersForceLogOff\Log\log.txt"
$servers = Import-Csv C:\RDPServersForceLogOff\INServerList.csv
$arrayserverlist = New-Object System.Collections.ArrayList
$arrayserverlist.Clear()

$msgbox = [System.Windows.Forms.MessageBox]::Show("This action will kill all the RDP inactive sessions.", "Status" , 1)
           if ($msgbox -eq "OK") {
                foreach ($server in $servers) {
           
                     if ($server.ServerNetwork -eq "IN") {
                            $arrayserverlist.Add((Get-TSSession -ComputerName $server.ServerName -State Disconnected | Where-Object {$_.SessionId -ne 0})) 
                            Get-TSSession -ComputerName $server.ServerName -State Disconnected  | Where-Object {$_.SessionId -ne 0} | Stop-TSSession -Force
                     }

                   Write-Output $arrayserverlist > $LogPath        
                 }          
   
              [System.Windows.Forms.MessageBox]::Show("All RDP disconnected sessions, are loged off now.", "Status" , 0)
            }

            else {
                   Stop-Process -ProcessName powershell
            }             
   