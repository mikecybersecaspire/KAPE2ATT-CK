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
    C:\Windows\Triage\KAPE\kape.exe --tsource C: --tdest C:\Windows\Triage\Export\%m --tflush --target Antivirus,RegistryHives,$MFT,Amcache,LNKFilesAndJumpLists,Prefetch,SRUM,ThumbCache --asu "Azure SAS URI here" --zip KAPETriage --msource C:\Windows\Triage\Export\%m --mdest C:\Windows\Triage\Export\ModulesOutput --module ThumbCacheViewer,AmcacheParser,PECmd,KapeResearch_Registry_SysCache_JSON,RegRipper,MFTECmd --mef csv --zpw zippasswordhere
} else {
    mkdir "C:\Windows\Triage\Export\ModulesOutput"
    C:\Windows\Triage\KAPE\kape.exe --tsource C: --tdest C:\Windows\Triage\Export\%m --tflush --target Antivirus,RegistryHives,$MFT,Amcache,LNKFilesAndJumpLists,Prefetch,SRUM,ThumbCache --asu "Azure SAS URI here" --zip KAPETriage --msource C:\Windows\Triage\Export\%m --mdest C:\Windows\Triage\Export\ModulesOutput --module ThumbCacheViewer,AmcacheParser,PECmd,KapeResearch_Registry_SysCache_JSON,RegRipper,MFTECmd --mef csv --zpw zippasswordhere
}

# 2 MIN TIMER TO COLLECT ALL EXPORT FILES, THEN DELETE TRIAGE FOLDER TO HIDE OPERATION FROM TA
Start-Sleep -s 123
Remove-Item -path C:\Windows\Triage\ -Recurse

