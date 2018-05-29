[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')      
$scuser = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter the user shortname", "Select the source user", "Shortname") 
$truser = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter the user shortname", "Select the target user", "Shortname")
$alert = [System.Windows.Forms.MessageBox]::Show("Press OK to continue to the next step or cancel to kill this process","Windows Alert",[System.Windows.Forms.MessageBoxButtons]::OKCancel)
switch($alert){
	    "OK" {

             Get-ADUser -Identity $scuser -Properties memberof |
             Select-Object -ExpandProperty memberof |
             Add-ADGroupMember -Members $truser -PassThru |
             Select-Object -Property SamAccountName

	    }

	    "Cancel" {

	        stop-process -id $PID
	    }
	}