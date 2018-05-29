# Set vars to use the script.
$src='C:\Users\Asaf David\Pictures'
$bucket='bestcasino-marketing'
$dst='segments/automatic-updates' 

# Move to the source folder.
cd $src

# Sync the file to s3 bucket.
aws s3 sync . s3://$bucket/$dst