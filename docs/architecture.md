# IAM Lab Architecture

**Last verified:** 2026-11-23  
**Status:** Windows Server base VM prepared; Active Directory not deployed.

## Verified current layout

~~~text
Windows 11 host (AK1RA)
  | PowerShell / WinRM client
  | 127.0.0.1:55985 (host-only loopback)
  v
VirtualBox NAT port forwarding
  |
  v
Windows Server 2025 Evaluation base VM
  WinRM HTTP TCP 5985, Negotiate enabled
  Authenticated PowerShell remoting validated
  VBoxService: Running / Automatic
~~~

This represents the **verified remote management path**, not a deployed domain or a Vagrant-managed environment.

### Confirmed

- Windows 11 host with VirtualBox and Vagrant installed.
- Initial Vagrantfile validated for syntax only.
- Manually created Windows Server 2025 Standard Evaluation VM booted successfully.
- VM configured with 2 vCPUs, 4 GB RAM and NAT networking.
- VM had no second active network adapter during NAT testing.
- WinRM listener, firewall scope, Negotiate authentication and remote PowerShell execution validated.
- Guest Additions service was running; its version was not yet verified.

### Planned but NOT implemented

~~~text
           Isolated corporate lab network (planned)
                      10.10.10.0/24
                          |
           +--------------+---------------+
           |                              |
          DC01                         CLIENT01
 Windows Server 2025              Windows 11 Evaluation
 10.10.10.10                      10.10.10.20
 AD DS + DNS (planned)            Domain join (planned)
~~~

| Component | Proposed configuration |
|---|---|
| DC01 | Windows Server 2025, 2 vCPU, 4 GB RAM |
| CLIENT01 | Windows 11 Evaluation, 2 vCPU, up to 4 GB RAM |
| DNS | 10.10.10.10 |
| Domain | corp.lab (provisional; subject to confirmation) |

The internal IP addresses are **planned**, not current VM addresses. The base VM has not been promoted to a domain controller.

## Constraints and safeguards

- Limit concurrent VMs to available RAM and disk performance.
- Prefer keeping VM data on the Windows host D: drive.
- Preserve operating system protections and firewall.
- Avoid directly exposing the domain controller to the internet.
- Do not publish credentials, keys, VM disks, or real administrative identities.
- Verify any previously exposed lab password has been changed before packaging the VM.
- Keep Vagrant communicator credentials outside tracked repository files.

For the completed networking and authentication checks, see [WinRM validation](winrm-setup.md).
