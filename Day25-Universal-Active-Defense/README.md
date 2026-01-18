# Day 25: Universal Active Defense & The "Stealth" Shell

**Status:** ✅ Complete
**Focus:** Kernel / EDR / Syscall ABI
**Milestone:** M2.1 (Universal Defense)

## Objective
Upgrade the Sentinel Engine from a simple "mkdir" tracker to a **Universal Active Defense System** capable of detecting and blocking destructive intent (`rm`, `unlink`) across modern, optimized shells.

## Technical Breakthroughs

### 1. The "Stealth Shell" Discovery (VFORK)
**The Problem:** While the engine tracked `bash` perfectly, it was blind to `/bin/sh` (dash).
**The Diagnosis:** `dash` is optimized for speed and uses `vfork` (Virtual Fork) instead of the standard `fork` or `clone` to spawn processes. My `ptrace` options were missing `PTRACE_O_TRACEVFORK`, allowing child processes to spawn, execute, and die invisibly.
**The Fix:**
```c
// src/engine/main.c
ptrace(PTRACE_SETOPTIONS, pid, 0, 
       PTRACE_O_TRACEFORK | PTRACE_O_TRACECLONE | PTRACE_O_TRACEVFORK); // <--- The Fix

```

### 2. The "Modern Deletion" Nuance (Unlinkat)

**The Problem:** The engine failed to block `rm file.txt` despite watching for `SYS_unlink`.
**The Insight:** Modern Linux `rm` utilities have migrated to `unlinkat` (Syscall 263) instead of the legacy `unlink` (Syscall 87).
**The Fix:** Updated the **Universal Syscall Map** to intercept `unlinkat` (register `RSI` holds the path) instead of just `unlink` (register `RDI`).

### 3. Active Blocking (The Kill Switch)

Successfully validated the full "OODA Loop" (Observe-Orient-Decide-Act):

1. **Intercept:** Kernel catches `unlinkat` via `ptrace`.
2. **Analyze:** Python Brain sees `SYSCALL:unlink:protected.txt`.
3. **Decide:** Policy Engine returns `BLOCK`.
4. **Enforce:** Engine injects `EPERM` (Operation not permitted).

## Artifacts

* **Universal Map:** `src/engine/syscall_map.h`
* **Recursive Engine:** `src/engine/main.c` (v2.1)
* **Neural Brain:** `src/analysis/brain.py`

## Outcome

Sentinel is no longer just a "logger." It is an active **Intrusion Prevention System (IPS)** that can see through shell optimizations and stop threats before they touch the disk.


