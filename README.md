
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

- [ ] WinRM diagnostics
- [ ] Secure remote management configuration
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

Technical documentation, implementation procedures, troubleshooting notes and test results will be added throughout the project.

## Author

**Jimmy Santos**

IT Support Technician | Cybersecurity Student

Focused on Identity & Access Management

[LinkedIn](https://www.linkedin.com/in/jimmydsantos/)
