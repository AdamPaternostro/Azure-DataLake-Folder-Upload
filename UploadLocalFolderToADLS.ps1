# Change these
$destinationDataLakeAccount = "mydatalakestore"
$destinationDatalakefolder = "Raw"
$subscriptionId = "00000000-0000-0000-0000-000000000000"

# Login Items
Login-AzureRmAccount 
Select-AzureRmSubscription -SubscriptionId $subscriptionId
 
# Upload to Data Lake
Get-ChildItem "C:\Users\myuser\Desktop\MyData\" | 
Foreach-Object {
    

    $fileToUpload = $_.FullName
    $dataLakePath = "/" + $destinationDatalakefolder + "/" + $_.Name
    $write =  "BEGIN Upload: " + $fileToUpload
    Write-Output $write
    Import-AzureRmDataLakeStoreItem -AccountName $destinationDataLakeAccount -Path $fileToUpload -Destination $dataLakePath -Force
    $write =  "END   Upload: " + $fileToUpload
    Write-Output $write

}
