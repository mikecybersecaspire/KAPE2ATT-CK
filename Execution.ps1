# Create the Targets output stage
$TargetFolder = "C:\Windows\Triage\Export"
if (Test-Path -Path $TargetFolder) {
    Expand-Archive "C:\Windows\Triage\KAPE.zip" -destinationpath "C:\Windows\Triage\"
    Remove-Item -path "C:\Windows\Triage\KAPE.zip" -Force
} else {
    mkdir "C:\Windows\Triage\Export"
    Expand-Archive "C:\Windows\Triage\KAPE.zip" -destinationpath "C:\Windows\Triage\"
    Remove-Item -path "C:\Windows\Triage\KAPE.zip" -Force
}

# Create the Modules output stage
$ModuleFolder = "C:\Windows\Triage\Export\ModulesOutput"
if (Test-Path -Path $ModuleFolder) {
    C:\Windows\Triage\KAPE\kape.exe --tsource C: --tdest C:\Windows\Triage\Export\%m --tflush --target Antivirus,RegistryHives,$MFT,Amcache,LNKFilesAndJumpLists,Prefetch,SRUM,ThumbCache --asu "https://aspiresoc.blob.core.windows.net/kapetriage?sp=racwdli&st=2023-01-23T08:26:46Z&se=2023-01-23T16:26:46Z&spr=https&sv=2021-06-08&sr=c&sig=YVJN9rv%2FQvir6eKK0%2B4lhn1FTz%2BWyE3%2Bl%2BqVWDJDZow%3D" --zip KAPETriage --msource C:\Windows\Triage\Export\%m --mdest C:\Windows\Triage\Export\ModulesOutput --module ThumbCacheViewer,AmcacheParser,PECmd,KapeResearch_Registry_SysCache_JSON,RegRipper,MFTECmd --mef csv --zpw secure-but-memorable-00
} else {
    mkdir "C:\Windows\Triage\Export\ModulesOutput"
    C:\Windows\Triage\KAPE\kape.exe --tsource C: --tdest C:\Windows\Triage\Export\%m --tflush --target Antivirus,RegistryHives,$MFT,Amcache,LNKFilesAndJumpLists,Prefetch,SRUM,ThumbCache --asu "https://aspiresoc.blob.core.windows.net/kapetriage?sp=racwdli&st=2023-01-23T08:26:46Z&se=2023-01-23T16:26:46Z&spr=https&sv=2021-06-08&sr=c&sig=YVJN9rv%2FQvir6eKK0%2B4lhn1FTz%2BWyE3%2Bl%2BqVWDJDZow%3D" --zip KAPETriage --msource C:\Windows\Triage\Export\%m --mdest C:\Windows\Triage\Export\ModulesOutput --module ThumbCacheViewer,AmcacheParser,PECmd,KapeResearch_Registry_SysCache_JSON,RegRipper,MFTECmd --mef csv --zpw secure-but-memorable-00
}

# 5 MIN TIMER TO COLLECT ALL EXPORT FILES, THEN DELETE TRIAGE FOLDER TO HIDE OPERATION
Start-Sleep -s 300
Remove-Item -path C:\Windows\Triage\ -Recurse

