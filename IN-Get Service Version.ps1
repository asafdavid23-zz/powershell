[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')      

$servers = Import-Csv -Path 'T:\Groups\SysAdmin\Scripts\PowerShell\Get Service Version\IN\DB\INServerSList.csv'
$service_Name = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter the service name: ")
$LogPath = 'T:\Groups\SysAdmin\Scripts\PowerShell\Get Service Version\IN\Log\log.txt'
$arrayitemslist = New-Object System.Collections.ArrayList
$arrayitemslist.Clear()


foreach ($server in $servers) {   
        if ($server.ServerType -like 'app') {
            if  ($service_Name -eq "outboundmessagesservicepw") {
                  $fileName =  '\\' + $server.ServerName + '\c$\Traffilog\Mobile Services\OutboundMessagesHandlerPW\OutboundMessagesServicePW.exe'

                  $arrayitemslist.add((Get-ItemProperty -Path $fileName | Format-List -Property name, lastwritetime, VersionInfo))
                  Write-Output $arrayitemslist > $LogPath 
            }

            elseif ($service_Name -eq "WebSocketService") { 
                    $fileName =  '\\' + $server.ServerName + '\c$\Traffilog\WebSocketService\WebSocketService.exe'

                    $arrayitemslist.add((Get-ItemProperty -Path $fileName | Format-List -Property name, lastwritetime, VersionInfo))
                    Write-Output $arrayitemslist > $LogPath               
            }
            
            elseif  ($service_Name -eq "OutboundMessagesHandler") { 
                    $fileName =  '\\' + $server.ServerName + '\c$\Traffilog\OutboundMessagesHandler\OutboundMessagesService.exe'

                    $arrayitemslist.add((Get-ItemProperty -Path $fileName | Format-List -Property name, lastwritetime, VersionInfo))
                    Write-Output $arrayitemslist > $LogPath               
            }
        }
            
        else { ($server.serverType -like 'con') 
            if  ($service_Name -eq "ConnectionService") {
                  $fileName =  '\\' + $server.ServerName + '\c$\Traffilog\FMS_Services\ConnectionService.exe'

                  $arrayitemslist.add((Get-ItemProperty -Path $fileName | Format-List -Property name, lastwritetime, VersionInfo))
                  Write-Output $arrayitemslist > $LogPath 
            }

            elseif ($service_Name -eq "dbHandlerService") { 
                    $fileName =  '\\' + $server.ServerName + '\c$\Traffilog\FMS_Services\dbHandlerService.exe'

                    $arrayitemslist.add((Get-ItemProperty -Path $fileName | Format-List -Property name, lastwritetime, VersionInfo))
                    Write-Output $arrayitemslist > $LogPath               
            }
            
            elseif  ($service_Name -eq "GeoHandlerService") { 
                    $fileName =  '\\' + $server.ServerName + '\c$\Traffilog\FMS_Services\GeoHandlerService.exe'

                    $arrayitemslist.add((Get-ItemProperty -Path $fileName | Format-List -Property name, lastwritetime, VersionInfo))
                    Write-Output $arrayitemslist > $LogPath
            }
            
            elseif  ($service_Name -eq "DataProcess") {  
                    $fileName =  '\\' + $server.ServerName + '\c$\Traffilog\DataProcess\DataProcess.exe'

                    $arrayitemslist.add((Get-ItemProperty -Path $fileName | Format-List -Property name, lastwritetime, VersionInfo))
                    Write-Output $arrayitemslist > $LogPath
            } 
        }
}