Invoke-Expression (&starship init powershell)
$PSStyle.FileInfo.Directory = "`e[1;34m" # bright blue
$PSStyle.FileInfo.SymbolicLink = "`e[1;36m" # bright cyan

Clear-Host
fastfetch --logo-padding-top 2 -l %USERPROFILE%/.config/fastfetch-icons/massive-fastfetch-logo.txt

# -------- vim config start --------

# Enable Vi Mode
Set-PSReadLineOption -EditMode Vi

# History Search Bindings
Set-PSReadLineKeyHandler -Chord 'k' -ViMode Command -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

Set-PSReadLineKeyHandler -Chord 'j' -ViMode Command -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

Set-PSReadLineKeyHandler -Key UpArrow -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

Set-PSReadLineKeyHandler -Key DownArrow -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

# Predictive IntelliSense (Fish-style ghost text)
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView

# -------- vim config end ----------

function e { explorer . }

Import-Module -Name Terminal-Icons

Set-PSReadLineKeyHandler -Key "Ctrl+," -Function AcceptSuggestion

# ------ yazi config start --------

$env:EDITOR = 'nvim'

function y {
	$tmp = (New-TemporaryFile).FullName
	yazi.exe @args --cwd-file="$tmp"
	$cwd = Get-Content -Path $tmp -Encoding UTF8
	if ($cwd -and $cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container)) {
		Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
	}
	Remove-Item -Path $tmp
}

# ------- yazi config end ---------

# ------- starship style toggle function -------

function tp {
    $style1 = "$HOME\.config\starship-styles\starship.toml"
    $style2 = "$HOME\.config\starship-styles\starship.color.toml"

    if ($env:STARSHIP_CONFIG -eq $style1) {
        [Environment]::SetEnvironmentVariable("STARSHIP_CONFIG", $style2, "User")
        $env:STARSHIP_CONFIG = $style2
        Write-Host "🚀 Switched to Starship Style 2" -ForegroundColor Cyan
    } else {
        [Environment]::SetEnvironmentVariable("STARSHIP_CONFIG", $style1, "User")
        $env:STARSHIP_CONFIG = $style1
        Write-Host "✨ Switched to Starship Style 1" -ForegroundColor Magenta
    }
}

# ------- starship style toggle function end -------
