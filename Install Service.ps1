<# #Install Service on a remote host. #>

[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') 

<# step-1 - Copy the service files to the remote host #>
$server  = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter the remote host name: ")
$service_source = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter the service source path: ")
$service_dest = '\\' + $server + '\c$\Traffilog\Mobile Services\'

Copy-Item $service_source $service_dest