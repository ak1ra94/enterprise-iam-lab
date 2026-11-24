
# Enterprise Active Directory & IAM Lab

**Status:** Infrastructure setup in progress

## Overview

A hands-on laboratory focused on Identity & Access Management (IAM), Windows Server administration, Active Directory and enterprise access control.

The project aims to simulate common identity administration scenarios in a controlled corporate environment.

All implementations, configurations and troubleshooting procedures will be documented as they are completed and validated.

## Objectives

- Deploy a Windows Server environment
- Configure an Active Directory domain
- Manage users, groups and organizational units
- Implement role-based access control (RBAC)
- Configure NTFS and shared folder permissions
- Simulate identity lifecycle processes
- Investigate authentication and authorization issues
- Automate administrative tasks using PowerShell
- Document security controls and audit procedures

## Technologies

- Windows Server 2025
- Windows 11
- Active Directory Domain Services
- PowerShell
- Oracle VirtualBox
- HashiCorp Vagrant
- Git and GitHub

Some technologies are planned for later stages and have not yet been implemented.

## Planned Architecture

| Component | Configuration |
|---|---|
| Host | Windows 11 |
| Hypervisor | VirtualBox |
| Automation | Vagrant |
| DC01 | Windows Server 2025 |
| CLIENT01 | Windows 11 Enterprise |
| Internal Network | 10.10.10.0/24 |
| DC01 IP | 10.10.10.10 |
| CLIENT01 IP | 10.10.10.20 |
| Domain | corp.lab (provisional) |

The internal network and domain have not yet been configured.

## Implementation Progress

### Completed

- [x] Host environment assessment
- [x] VirtualBox installation and validation
- [x] Vagrant installation and validation
- [x] Laboratory directory structure
- [x] Windows Server 2025 installation
- [x] Initial VM hardware and network verification
- [x] Initial Vagrantfile syntax validation

### Pending

- [x] WinRM service, listener and authentication diagnostics (2026-11-23)
- [x] Local-only NAT forwarding for WinRM remote management
- [x] Host-to-guest authenticated Negotiate and PowerShell execution
- [x] VirtualBox Guest Additions service running
- [ ] Guest Additions version verification
- [ ] Verify password rotation and safe communicator credential handling
- [ ] Vagrant base box creation
- [ ] First successful Vagrant deployment
- [ ] DC01 deployment
- [ ] CLIENT01 deployment
- [ ] Isolated laboratory network
- [ ] Active Directory installation
- [ ] User and group management
- [ ] Access control implementation
- [ ] PowerShell automation
- [ ] Authentication troubleshooting
- [ ] Access auditing

## Security Considerations

- All activities are restricted to personal lab systems.
- No production credentials or sensitive data will be published.
- Domain controllers will not be directly exposed to the internet.
- Security configurations will be documented and validated.
- Planned activities will not be represented as completed work.

## Documentation

- [WinRM setup and validation](docs/winrm-setup.md): real results from the November 23, 2026 lab
- [Architecture](docs/architecture.md): confirmed management path and separately marked future AD topology
- [WinRM demo script](scripts/demo-winrm.ps1): credential-prompted, sanitized remote verification
- [Git ignore rules](.gitignore): excludes local VM artifacts and common secret files

**Validated milestone (2026-11-23):** Windows 11 host successfully authenticated to the Windows Server 2025 evaluation guest through a loopback-only VirtualBox NAT forwarding rule and executed remote PowerShell commands via WinRM/Negotiate. This is a host-to-guest infrastructure milestone, not proof of a deployed Active Directory domain or Vagrant-managed VM.

An optional redacted screenshot may be added under `evidence/` after review; none is included yet.

## Author

**Jimmy Santos**

IT Support Technician | Cybersecurity Student

Focused on Identity & Access Management

[LinkedIn](https://www.linkedin.com/in/jimmydsantos/)
