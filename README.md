# Systems Security Research Log (100 Days)

![Status](https://img.shields.io/badge/status-active_research-green)
![Focus](https://img.shields.io/badge/focus-behavioral_edr_kernel-363636)
![Role](https://img.shields.io/badge/role-system_security_researcher-purple)

**The daily experimental log for the Sentinel Runtime Verification System.**

This repository tracks the chronological progress of engineering a custom Linux Kernel EDR from scratch. It serves as the "raw data" and proof-of-work that feeds into the formal documentation.

🔗 **Formal Research Dossier:** [nevinshine.github.io/runtime-security-dossier](https://nevinshine.github.io/system-security-research-dossier/)

---

## Research Timeline

| Day | Topic | Domain | Status |
| :--- | :--- | :--- | :--- |
| **Day 31** | Sentinel M3.0: Semantic Mapping (Cognitive Engine) | Analysis / Python | **✅ Completed** |
| **Day 30** | Research Milestone Release (M2 & M2.1) | Documentation | **✅ Completed** |
| **Day 29** | Sentinel M2.1: Active Blocking (VFORK) | Kernel / EDR | **✅ Completed** |
| **Day 28** | Hyperion M2: Stateful Firewall (eBPF Maps)| Network / XDP | **✅ Completed** |
| **Day 27** | Hyperion M1: Stateless Filter (Drop IP) | Network / XDP | **✅ Completed** |
| **Day 26** | Hyperion Project Init (XDP Environment) | Network / XDP | **✅ Completed** |
| **Day 25** | **Universal Active Defense (M2.1)** | **Kernel / EDR** | ✅ **Completed** |
| **Day 24** | **Modular Research Architecture (Refactor)** | Engineering / C | ✅ **Completed** |
| **Day 23** | **Recursive Process Tree Tracking (M2.0)** | Kernel / EDR | ✅ **Completed** |
| **Day 22** | **Sentinel Platform (Orchestrator + Eye)** | Systems / Ptrace | ✅ **Completed** |
| **Day 21** | **Active Blocking (Kill Switch)** | Systems / IPC | ✅ **Completed** |
| **Day 20** | **Live Neural Defense (v1.0)** | AI / Integration | ✅ **Completed** |
| **Day 19** | **IPC Bridge (v0.9)** | Kernel / Python | ✅ **Completed** |
| **Day 18** | **Deep Argument Inspection (v0.8)** | Kernel / Ptrace | ✅ **Completed** |
| **Day 17** | System Standby (Recovery) | Health | ⏸️ **Paused** |
| **Day 16** | **Dossier V1.0 Launch** | Documentation | ✅ **Released** (Linked above) |
| **Day 15** | Research Methodology | ADRs | ✅ Completed |
| **Day 14** | Environment Stabilization | Infrastructure | ✅ Completed |
| **Day 13** | Code Review (Sentinel v0.7) | C / Ptrace | ✅ Completed |
| **Day 12** | Runtime Anomaly Classification | Machine Learning | ✅ Completed |
| **Day 11** | Syscall Scoring Validation | Data Analysis | ✅ Completed |
| **Day 10** | Temporal Feature Engineering | Data Science | ✅ Completed |
| **Day 09** | Architecture Freeze | System Design | ✅ Completed |
| **Day 08** | Weightless Neural Network (DWN) | AI / ML | ✅ Completed |
| **Day 07** | Automated IPS (Fail2Ban) | NetSec | ✅ Completed |
| **Day 06** | SSH Hardening & Key Auth | Access Control | ✅ Completed |
| **Day 05** | File Integrity Monitoring (FIM) | Host Security | ✅ Completed |
| **Day 04** | Firewall Automation (UFW) | NetSec | ✅ Completed |
| **Day 03** | Intrusion Detection (Port Scan) | NetSec | ✅ Completed |
| **Day 02** | Process Signals (SIGSTOP/CONT) | Kernel | ✅ Completed |
| **Day 01** | Identity & Account Audit | IAM | ✅ Completed |

---

## Tech Stack
* **Core:** C, Python, Bash
* **Kernel:** `ptrace`, `sys/user.h`, `sys/ptrace.h`, `PTRACE_O_TRACEFORK`
* **ML:** Scikit-Learn, Custom Weightless Neural Networks (WiSARD)
* **Target:** Linux (Ubuntu/Debian)

---
*“Verba volant, scripta manent.”*
