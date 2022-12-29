# stardust's winfetch config

# Set the version of Windows to derive the logo from.
$logo = "Windows 10"

function info_custom_title {
	return @{
		title = " ​ ​  "
		content = "${e}[1;33m{0}${e}[0m@${e}[1;33m{1}${e}[0m" -f [System.Environment]::UserName,$env:COMPUTERNAME 
		}
}

function info_custom_dashes {
	return @{
		content = "┌───────────────────────────────┐"
		}
}

function info_custom_os {
	return @{
		title = " ​ ​  "
		
		# Removes "[64-bit]" from "Windows 11 Pro"
		content = "$($os.Caption.TrimStart('Microsoft ')) [$($os.OSArchitecture)]".Trim("[64-bit]")
		}
}

function info_custom_pwsh {
	return @{
		title = " ​ ​  "
		content = "Powershell v$($PSVersionTable.PSVersion)"
		}
}

function info_custom_terminal {
	$terminal = info_terminal
	return @{
		title = " ​ ​  "
		content = $terminal["content"]
		}
}

function info_custom_uptime {
	$uptime = info_uptime
	return @{
		title = " ​ ​  "
		content = $uptime["content"]
		}
}

function info_custom_pkgs {
	$pkgs = info_pkgs
	return @{
		title = " ​ ​  "
		content = $pkgs["content"]
		}		
}

function info_custom_cpu {
	$cpu = info_cpu
	return @{
		title = " ​ ​  "
		content = $cpu["content"]
		}		
}

function info_custom_gpu {
	$gpu = info_gpu
	return @{
		title = " ​ ​  "
		content = $gpu["content"]
		}
			
}

function info_custom_blank {
	return @{
		content = "└───────────────────────────────┘"
		}
}

function info_custom_colorbar {
	return @{
		title = ""
		content = "`t                     " 
		}        
}
@(
"custom_title"
"custom_dashes"
"custom_os"
"custom_pwsh"
"custom_terminal"
"custom_uptime"
"custom_pkgs"
"custom_cpu"
"custom_gpu"
"custom_blank"
# "custom_colorbar"
)
