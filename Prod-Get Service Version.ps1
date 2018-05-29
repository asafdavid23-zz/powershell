[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')    

$servers  =  Import-Csv -Path 'T:\Groups\SysAdmin\Scripts\PowerShell\Get Service Version\Prod\DB\ProdServerList.csv'
$serverType = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter the service name: ")
$LogPath  = 'T:\Groups\SysAdmin\Scripts\PowerShell\Get Service Version\Prod\Log\AppServerLog.txt'
$LogPath1 = 'T:\Groups\SysAdmin\Scripts\PowerShell\Get Service Version\Prod\Log\ConServerLog.txt'
$arrayitemslist = New-Object System.Collections.ArrayList
$arrayitemslist.Clear()


foreach ($server in $servers) {
            if ($ServerType -like 'app') {   
                  $fileName1 =  '\\' + $server.ServerName + '\c$\Traffilog\Mobile Services\OutboundMessagesHandlerPW\OutboundMessagesServicePW.exe'
                  $fileName2 =  '\\' + $server.ServerName + '\c$\Traffilog\WebSocketService\WebSocketService.exe'
                  $fileName3 =  '\\' + $server.ServerName + '\c$\Traffilog\OutboundMessagesHandler\OutboundMessagesService.exe'

                  $arrayfileslist = $fileName1,$fileName2,$fileName3
                  
                  $arrayitemslist.add((Get-Itemproperty $arrayfileslist | Format-List -Property Name, LastWriteTime, VersionInfo))
                  Write-Output $arrayitemslist > $LogPath 
            }

            elseif ($ServerType -like 'con') {
                $fileName1 =  '\\' + $server.ServerName + '\c$\Traffilog\FMS_Services\ConnectionService.exe'
                $fileName2 =  '\\' + $server.ServerName + '\c$\Traffilog\FMS_Services\dbHandlerService.exe'
                $fileName3 =  '\\' + $server.ServerName + '\c$\Traffilog\FMS_Services\GeoHandlerService.exe'
                $fileName4 =  '\\' + $server.ServerName + '\c$\Traffilog\DataProcess\DataProcess.exe'
                
                $arrayfileslist = $fileName1,$fileName2,$fileName3,$fileName4

                $arrayitemslist.add((Get-Itemproperty $arrayfileslist | Format-List -Property Name, LastWriteTime, VersionInfo))
                Write-Output $arrayitemslist > $LogPath1
            }


}