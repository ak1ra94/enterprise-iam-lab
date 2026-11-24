# WinRM Remote Management Validation

**Lab date:** 2026-11-23  
**Status:** Validated from Windows 11 host to Windows Server 2025 guest

## Goal

Confirm remote administration between a Windows 11 host and a Windows Server 2025 lab VM using VirtualBox NAT, WinRM and PowerShell. This is **infrastructure groundwork for IAM**, not an Active Directory deployment.

## Verified environment

| Component | Verified result |
|---|---|
| Host | Windows 11 (AK1RA) |
| Guest | Windows Server 2025 Standard Evaluation |
| Virtualization | VirtualBox NAT |
| WinRM service | Running / Automatic |
| WinRM listener | HTTP TCP 5985, enabled |
| Guest network profile | Public |
| Firewall rule | Public WinRM inbound allowed; remote scope LocalSubnet |
| Authentication | Negotiate and Kerberos enabled; Basic disabled |
| Message protection | AllowUnencrypted = false |
| NAT forwarding | Host loopback 127.0.0.1:55985 to guest TCP 5985 |
| WS-Man connectivity | Successful from host |
| Authenticated command execution | Successful from host |

Machine-generated hostname and full administrative principal are intentionally omitted from this public document.

## Diagnostics performed inside the guest

Run these read-only commands in an elevated PowerShell session inside Windows Server:

~~~powershell
Get-Service WinRM | Select-Object Name, Status, StartType
Test-WSMan localhost
winrm enumerate winrm/config/listener
Get-NetConnectionProfile | Select-Object InterfaceAlias, NetworkCategory
Get-NetFirewallRule -Name 'WINRM*' | Select-Object Name, Enabled, Profile, Direction, Action
Get-NetFirewallRule -Name 'WINRM-HTTP-In-TCP-PUBLIC' | Get-NetFirewallAddressFilter | Select-Object LocalAddress, RemoteAddress
winrm get winrm/config/service/auth
winrm get winrm/config/service
Get-LocalUser | Select-Object Name, Enabled, PasswordRequired
~~~

The service, listeners, firewall rule, message protection and authentication settings were inspected and recorded. An authenticated Invoke-Command also succeeded from within the guest.

## Host-to-guest connectivity

On the Windows 11 **host**, a VirtualBox NAT rule was created to bind the forwarded port to **host loopback only**. This snippet is illustrative; replace the VM name and do not add a duplicate rule if it already exists:

~~~powershell
& 'D:\Aplicativos\VirtualBox\VBoxManage.exe' controlvm '<VM_NAME>' natpf1 'winrm,tcp,127.0.0.1,55985,,5985'
& 'D:\Aplicativos\VirtualBox\VBoxManage.exe' showvminfo '<VM_NAME>' --machinereadable | Select-String 'Forwarding|natpf'
Test-NetConnection -ComputerName 127.0.0.1 -Port 55985
Test-WSMan -ComputerName 127.0.0.1 -Port 55985
~~~

**Observed:** the NAT rule was visible, TcpTestSucceeded was True, and the guest WS-Man service responded through the forwarded endpoint.

## Explicit authentication and remote execution

The following **host-side** tests were completed successfully. Credentials were supplied through a secure prompt; they were not placed in source files:

~~~powershell
$cred = Get-Credential -Message 'Enter your lab Windows Server credentials'
Test-WSMan -ComputerName 127.0.0.1 -Port 55985 -Authentication Negotiate -Credential $cred
Invoke-Command -ComputerName 127.0.0.1 -Port 55985 -Authentication Negotiate -Credential $cred -ScriptBlock {
    hostname
    whoami
}
~~~

**Observed:** the remote hostname and authenticated local administrator identity were returned. Their actual values are intentionally redacted here.

A repeatable, privacy-aware demonstration script is available at [scripts/demo-winrm.ps1](../scripts/demo-winrm.ps1).

## Security decisions

- Keep Basic authentication disabled and AllowUnencrypted set to false.
- Preserve Windows Firewall and the host's security protections.
- The test used WinRM **HTTP** with Negotiate. Message-level protection is not equivalent to HTTPS/TLS.
- The host forwarding endpoint was bound to 127.0.0.1, not to all host network interfaces.
- The test environment is privately owned; no production or external systems were accessed.
- Do not publish administrative identifiers, credentials, VM images or unredacted screenshots.
- **Credential follow-up pending:** a credential-like value appeared in the terminal during the study session. Any affected password must be rotated before VM packaging. Rotation has not yet been confirmed.

## Next steps

- [x] Diagnose WinRM service, listener, firewall and authentication
- [x] Verify guest-local authenticated execution
- [x] Set up loopback-bound NAT forwarding
- [x] Verify TCP and WS-Man from Windows 11 host
- [x] Verify authenticated Negotiate and remote PowerShell execution
- [x] Confirm VirtualBox Guest Additions service Running/Automatic
- [ ] Verify Guest Additions version
- [ ] Confirm password rotation / secret hygiene
- [ ] Prepare secure Vagrant communicator configuration
- [ ] Package a local-only Windows Server base box
- [ ] Validate first Vagrant-managed deployment

**Boundary:** A Windows Server remote administration channel is operational; AD DS, DC01, CLIENT01 and Vagrant provisioning remain unimplemented.
