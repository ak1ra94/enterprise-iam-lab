# WinRM validation demonstration
# Run only against your own or explicitly authorized Windows lab.
# No passwords, administrator names or hostnames are embedded or printed.
# From the Windows 11 host: .\demo-winrm.ps1

[CmdletBinding()]
param(
    [ValidateNotNullOrEmpty()]
    [string]$ComputerName = '127.0.0.1',

    [ValidateRange(1, 65535)]
    [int]$Port = 55985
)

$ErrorActionPreference = 'Stop'

try {
    $credential = Get-Credential -Message 'Enter your Windows Server lab credentials'
    if ($null -eq $credential) {
        throw 'Credentials were not provided.'
    }

    $result = Invoke-Command -ComputerName $ComputerName -Port $Port -Authentication Negotiate -Credential $credential -ErrorAction Stop -ScriptBlock {
        [PSCustomObject]@{
            Server = $env:COMPUTERNAME
            Identity = (whoami)
            WinRM = (Get-Service -Name WinRM -ErrorAction Stop).Status.ToString()
        }
    }

    if ([string]::IsNullOrWhiteSpace($result.Server) -or
        [string]::IsNullOrWhiteSpace($result.Identity) -or
        $result.WinRM -ne 'Running') {
        throw 'Unexpected result from the remote server.'
    }

    Clear-Host
    Write-Host ''
    Write-Host '  ==============================================' -ForegroundColor DarkCyan
    Write-Host '           AK1RA // IDENTITY SECURITY LAB' -ForegroundColor Cyan
    Write-Host '  ==============================================' -ForegroundColor DarkCyan
    Write-Host ''
    Write-Host '  MODULE    : Identity & Access Management'
    Write-Host '  PROTOCOL  : WinRM / Negotiate'
    Write-Host '  TARGET    : Windows Server Lab'
    Write-Host ''
    Write-Host '  [+] REMOTE CONNECTION ESTABLISHED' -ForegroundColor Green
    Write-Host '  [+] IDENTITY AUTHENTICATED' -ForegroundColor Green
    Write-Host '  [+] REMOTE EXECUTION VERIFIED' -ForegroundColor Green
    Write-Host ''
    Write-Host '  ----------------------------------------------' -ForegroundColor DarkGray
    Write-Host '  SERVER    : [REDACTED]'
    Write-Host '  IDENTITY  : [REDACTED]'
    Write-Host ('  WINRM     : {0}' -f $result.WinRM) -ForegroundColor Green
    Write-Host '  ----------------------------------------------' -ForegroundColor DarkGray
    Write-Host ''
    Write-Host '  Trust, but verify.' -ForegroundColor Cyan
    Write-Host ''
}
catch {
    # Error details may include local paths or identifiers; omit them from public screenshots.
    Clear-Host
    Write-Host ''
    Write-Host '  [!] WINRM VALIDATION FAILED' -ForegroundColor Red
    Write-Host '  Review connectivity, credentials and remoting permissions locally.' -ForegroundColor Yellow
    Write-Host ''
    exit 1
}
finally {
    $credential = $null
}
