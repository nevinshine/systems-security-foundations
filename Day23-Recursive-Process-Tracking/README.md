# Day 23: Recursive Process Tracking (Sentinel M2.0)

**Date:** 2026-01-15
**Focus:** Linux Kernel / Process Lineage / EDR
**Milestone:** [M2.0-experimental](https://github.com/nevinshine/sentinel-runtime/releases/tag/M2.0-experimental)

## 📝 Research Problem: The "Grandchild Blind Spot"
Standard `ptrace` (used in Day 1-22) is shallow. It only monitors the immediate process.
* **Vulnerability:** If a monitored shell (`/bin/bash`) spawns a child process (e.g., `python3 malware.py`), the child executes outside the tracer's scope.
* **Impact:** Malware can bypass detection simply by forking.

## 🛠️ Engineering Solution (M2.0)
I implemented **Recursive Fork Tracking** using `PTRACE_O_TRACEFORK`.

### 1. Kernel Option Setting
Instructed the kernel to auto-attach Sentinel to any new process spawned by the tracee:
```c
// Force auto-attachment to all future child processes
ptrace(PTRACE_SETOPTIONS, pid, 0, PTRACE_O_TRACEFORK);
