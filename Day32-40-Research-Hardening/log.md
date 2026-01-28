# Day 32-40: Research Hardening & Artifact Stabilization

**Objective:** Transition Sentinel from a functional prototype (M3.0) into a hardened, research-grade artifact (M3.4) ready for public scrutiny.

## Engineering Sprint (The "Mainstream" Prep)

### 1. M3.1: The State Machine (Taint Persistence)
* **Goal:** Defeat "Laundering" attacks where data is moved between file descriptors.
* **Implementation:** Built a cross-process State Machine in `brain.py`.
* **Logic:** `SENSITIVE_DATA_HELD` tag now propagates: `File (FD 3)` -> `dup2()` -> `Socket (FD 5)`.
* **Result:** Blocked sophisticated "Read-Dup-Write" exfiltration chains.

### 2. M3.2: Performance Benchmarking
* **Goal:** Quantify the "cost" of security to prove viability.
* **Metrics:**
    * **Syscall Overhead:** ~30x (Standard for `ptrace` context switching).
    * **IPC Throughput:** 28k+ events/second (High burst tolerance).
    * **Memory:** ~100MB (Stable).

### 3. M3.3: Canonicalization (Anti-Evasion)
* **Goal:** Stop attackers from hiding behind symlinks (TOCTOU).
* **Implementation:** Integrated `os.path.realpath` into the Semantic Engine.
* **Outcome:** Sentinel now sees the *physics* of the filesystem (inode targets), not just the *names*.

### 4. M3.4: Watchdog Persistence (T1562.001)
* **Goal:** Prevent the security stack from being killed by malware.
* **Implementation:** Engineered `scripts/watchdog.sh` as a parent supervisor.
* **Mechanism:** Instant resurrection of the Sentinel engine upon `SIGKILL`.

## Release Prep
* **Restructuring:** Separated `src/` (Logic) from `tests/` (Verification) for clean architecture.
* **Evidence:** Recorded immutable `.gif` artifacts for the README.
* **Tagging:** Released **M3.4-final** as the official Research Artifact.

## Sprint Outcome
Sentinel is no longer just a "learning project"—it is a defensible security tool capable of resisting active tampering.
