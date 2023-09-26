if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[console]::WindowHeight = 25;[console]::WindowWidth = 105
[console]::BufferHeight = 25;[console]::BufferWidth = 105
[console]::Title = "ZScaler VPN Bypass";[Console]::CursorVisible = $false
[console]::WindowHeight = 25;[console]::WindowWidth = 105


while($true)
{
	Write-Host "  _____  _____            __            "
	Write-Host " /__  / / ___/_________ _/ /__  _____   "
	Write-Host "   / /  \__ \/ ___/ __ '/ / _ \/ ___/   "
	Write-Host "  / /_____/ / /__/ /_/ / /  __/ /       "
	Write-Host " /____/____/\___/\__,_/_/\___/_/        "
	Write-Host " "
	Write-Host "     ____                             "
	Write-Host "    / __ )__  ______  ____ ___________"
	Write-Host "   / __  / / / / __ \/ __ '/ ___/ ___/"
	Write-Host "  / /_/ / /_/ / /_/ / /_/ (__  |__  ) "
	Write-Host " /_____/\__, / .___/\__,_/____/____/ "
	Write-Host "       /____/_/                       "
	Write-Host " "
	Write-Host " "

	Write-Host " "
	Write-Host "1. ZScaler bypass [zscaler app is working in background, but internet connection is not filtered by it]"
	Write-Host "                  {it works permanently, no need to run this script in background}"
	Write-Host " "
	Write-Host "2. ZScaler killer [all zscaler processes are constantly being killed by this script]"
	Write-Host "                  {it works as long as this script is running}"
	Write-Host " "
	$menu = Read-Host "Choose an option: "

	if ($menu -eq '1') {
		$confirmation = Read-Host "Do you want to enable/disable ZScaler Bypass? [e - enable / d - disable]"

		if ($confirmation -eq 'e') {
			Get-NetAdapterBinding -AllBindings -ComponentID ZS_ZAPPRD | Disable-NetAdapterBinding
			clear
			Write-Host " "
			Write-Host " ______                                    _ "
			Write-Host " | ___ \                                  | |"
			Write-Host " | |_/ /_   _ _ __   __ _ ___ ___  ___  __| |"
			Write-Host " | ___ \ | | | '_ \ / _' / __/ __|/ _ \/ _' |"
			Write-Host " | |_/ / |_| | |_) | (_| \__ \__ \  __/ (_| |"
			Write-Host " \____/ \__, | .__/ \__,_|___/___/\___|\__,_|"
			Write-Host "         __/ | |                             "
			Write-Host "        |___/|_|                             "
			Start-Sleep -Seconds 2
			break
		}
		if ($confirmation -eq 'd') {
			Get-NetAdapterBinding -AllBindings -ComponentID ZS_ZAPPRD | Enable-NetAdapterBinding
			clear
			Write-Host " "
			Write-Host "   ____                   "
			Write-Host "  |  _ \  ___  _ __   ___ "
			Write-Host "  | | | |/ _ \| '_ \ / _ \"
			Write-Host "  | |_| | (_) | | | |  __/"
			Write-Host "  |____/ \___/|_| |_|\___|"
			Start-Sleep -Seconds 2
			break
		}
		if ($confirmation -ne 'd' -and $confirmation -ne 'e') {
			Write-Host " "
			Write-Host "Please provide valid parameter!"
			Start-Sleep -Seconds 1
			clear
		}
	}
	if ($menu -eq '2') {
		$zproc = Get-Process -Name ZSA*
		while ($true) {
			clear
			if ($zproc) {
				Stop-Process -Name ZSA* -Force
			}
			Write-Host " "
			Write-Host "   _  ___ _ _ _                   "
			Write-Host "  | |/ (_) | (_)                  "
			Write-Host "  | ' / _| | |_ _ __   __ _       "
			Write-Host "  |  < | | | | | '_ \ / _` |      "
			Write-Host "  | . \| | | | | | | | (_| |_ _ _ "
			Write-Host "  |_|\_\_|_|_|_|_| |_|\__, (_|_|_)"
			Write-Host "                       __/ |      "
			Write-Host "                      |___/       "
			Start-Sleep -Seconds 1
		}
		break
	}
	if ($menu -ne '1' -and $menu -ne '2') {
			Write-Host " "
			Write-Host "Please provide valid parameter!"
			Start-Sleep -Seconds 1
			clear
		}
}

exit
