
# Enterprise Active Directory & IAM Lab

**Status:** Base VM preparation assessed; Vagrant deployment pending (2026-11-24)

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

- [x] WinRM service, listener and authentication diagnostics (2026-11-23)
- [x] Local-only NAT forwarding for WinRM remote management
- [x] Host-to-guest authenticated Negotiate and PowerShell execution
- [x] VirtualBox Guest Additions service running
- [x] Guest Additions version verified against host (2026-11-24)
- [x] Administrator password rotation reported and current credential tested via WinRM
- [x] WinRM communicator configuration validated with a temporary environment variable
- [x] NAT forwarding persistence and authenticated execution verified after a full shutdown/start cycle
- [x] Standalone server, installed roles, local accounts and administrator membership inventoried
- [x] Host and guest storage capacity assessed

### Pending

- [ ] Evaluate Windows image generalization and per-machine credential rotation before packaging
- [ ] Verify shared folders and Vagrant communicator end-to-end
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

**Validated milestone (2026-11-24):** Guest Additions matched the installed VirtualBox version. A failed executable-path lookup was resolved through service and command discovery. Vagrant configuration validation initially failed because the password environment variable was absent; validation succeeded after temporary credential injection. The NAT forwarding rule persisted across a full shutdown/start cycle, and TCP, WS-Man and authenticated PowerShell execution succeeded again. The guest remains a standalone server without AD DS installed; only the built-in Administrator was listed as a direct member of the local Administrators group. Image generalization, packaging and actual Vagrant-managed authentication remain pending.

## Learning and Validation Log

**2026-11-25 — Foundational knowledge review (theory only)**

- Reviewed virtualization, Guest Additions, Vagrant, WinRM, NAT, credential handling and layered troubleshooting.
- Reinforced authentication versus authorization, Kerberos, LDAP, identity lifecycle management, domain membership versus network profile, and well-known Windows security identifiers (SIDs).
- Completed a 20-question self-assessment with 18 correct answers (90%), followed by a targeted six-question corrective assessment with six correct answers (100%).
- No infrastructure changes were made during this session. The last validated technical milestone remains 2026-11-24. Image preparation, box packaging and the first Vagrant-managed deployment remain pending.

The box must remain private: a disk image may contain local credential material. No credentials or raw disk images are included in this documentation.

An optional redacted screenshot may be added under `evidence/` after review; none is included yet.

## Author

**Jimmy Santos**

IT Support Technician | Cybersecurity Student

Focused on Identity & Access Management

[LinkedIn](https://www.linkedin.com/in/jimmydsantos/)
