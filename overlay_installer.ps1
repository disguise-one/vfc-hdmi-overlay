.\devcon.exe dp_add .\VFC.inf | Out-File -FilePath .\overlay_install_log.txt -Append
.\devcon.exe update .\VFC.inf "USB\VID_0403&PID_6030" | Out-File -FilePath .\overlay_install_log.txt -Append
