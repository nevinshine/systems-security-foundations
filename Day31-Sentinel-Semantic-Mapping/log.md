# Day 31: Sentinel M3.0 (Semantic Mapping)

**Objective:** Bridge the "Semantic Gap" between raw paths and security concepts.

## Activities
1.  **Designed the Knowledge Base:** Mapped raw regex patterns (e.g., `/lib/.*\.so`) to Semantic Tags (`SHARED_LIBRARY`).
2.  **Implemented the Mapper:** Created `src/analysis/semantic.py` to classify file paths in real-time.
3.  **Upgraded the Brain:** Integrated the mapper into `brain.py` to enforce policies based on *concepts* (`SENSITIVE_USER_FILE`) rather than just raw strings.

## Verification
* **Test:** `touch /tmp/testfile`
* **Result:** Tagged as `TEMP_FILE` -> **ALLOWED**.
* **Test:** `rm protected.txt`
* **Result:** Tagged as `SENSITIVE_USER_FILE` -> **BLOCKED** (`EPERM`).

**Outcome:**
Sentinel now operates on a "Cognitive" level, understanding the *nature* of the file being accessed.
