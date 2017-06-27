Param(
    [Parameter(Mandatory=$True,Position=0)]
        [string]$srcfolder, #Add whatever source folder here    
    [Parameter(Mandatory=$True,Position=2)]
        [string]$dstfolder #Add whatever destination folder here
)

$filter = '*.*'

$fsw = New-Object IO.FileSystemWatcher $srcfolder, $filter -Property @{IncludeSubdirectories = $true;NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'}

Register-ObjectEvent $fsw Changed -SourceIdentifier FileUpdated -Action{
    $name = $Event.SourceEventArgs.Name
    $changeType = $Event.SourceEventArgs.ChangeType
    $timeStamp = $Event.TimeGenerated
    Write-Host "The file '$name' was $changeType at $timeStamp"
    Copy-Item -Path $Event.SourceEventArgs.FullPath -Destination  $dstfolder -Force
}

Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action{
    $name = $Event.SourceEventArgs.Name
    $changeType = $Event.SourceEventArgs.ChangeType
    $timeStamp = $Event.TimeGenerated
    Write-Host "The file '$name' was $changeType at $timeStamp"
    Copy-Item -Path $Event.SourceEventArgs.FullPath -Destination  $dstfolder -Force
}

# To list the events that have been registered in PoSH: Get-EventSubscriber 
# To cancel FileUpdated event: Unregister-Event FileUpdated
# To cancel FileCreated event: Unregister-Event FileCreate