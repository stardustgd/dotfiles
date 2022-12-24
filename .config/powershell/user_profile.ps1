# Read from .env
Push-Location -Path ~
Get-Content .env | foreach {
		$name, $value = $_.split('=')
		Set-Item "Env:$name" $value
}
Pop-Location

# Load prompt config
oh-my-posh --init --shell pwsh --config $env:POSH_PATH | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# Fzf
Import-Module PSFzF
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Aliases
Set-Alias vim nvim
Set-Alias grep findstr

#Utilities
function piconnect {
	ssh "$env:PI_IP_ADDRESS"
}

function startwork {
	Push-Location -Path $env:STARTWORK_PATH.Replace('"', "")
	python startwork.py
	Pop-Location
}

function which($command) {
		Get-Command -Name $command -ErrorAction SilentlyContinue |
			Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
