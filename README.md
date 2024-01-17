# ZScaler Bypass/Killer Script
Simple PowerShell script, that is bypassing/killing ZScaler.
<br><br>
<b>Requirements:</b> `admin privileges`
<br>
There are 2 options in the script:
<br>
1. <b>Bypassing the ZScaler</b> - disabling binding to a network adapter. As a result the ZScaler app is still working, but is excluded from traffic. <i>This option is lasting even after turning off the script.</i>
2. <b>Killing the ZScaler</b> - killing ZScaler process in a loop as long as the script is working. <i>This option requires the script to run the whole time.</i>
<b>If there is a problem with permissions, run following command in PowerShell (no admin privileges needed):</b>


<b>If there is a problem with permissions, run following command in PowerShell (no admin privileges needed):</b>
<br>
```Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser```
<br>
