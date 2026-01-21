# Day 29: Sentinel M2.1 (Universal Active Defense)

**Objective:** Enable active blocking and VFORK tracking.

## Activities
1.  Added `PTRACE_O_TRACEVFORK` to handle optimized shells (`dash`, `sh`).
2.  Implemented the "Kill Switch" protocol: Injecting `EPERM` on malicious syscalls.
3.  Verified "Block-on-Intent" by attempting to `rm protected.txt`.
4.  Updated the Python Brain to send BLOCK signals via IPC.

**Outcome:** Sentinel can now actively prevent file deletion in real-time.
