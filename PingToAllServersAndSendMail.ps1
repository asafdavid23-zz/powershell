$mailTo = "asaf.david@tangelogames.com"
$mailFrom = "ping_monitor@tangelogames.com" 
$Subject = "Notification from XYZ" 
$Body = "this is a notification from XYZ Notifications.."
$SmtpServer = "smtp.gmail.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("asaf.david@tangelogames.com", "Asf26.com")

$SMTPClient.Send($mailFrom, $mailTo, $Subject, $Body)