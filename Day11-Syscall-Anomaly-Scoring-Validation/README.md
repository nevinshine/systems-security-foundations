# Day 11: Syscall Anomaly Scoring Validation (Research)

## Objective
Validate and understand the behavior of anomaly scores produced by the Sentinel Sandbox’s **Weightless Neural Network (DWN)** before introducing decision thresholds.

The focus of this day was **analysis and stabilization**, not adding new features.

---

## Context
By Day 10, the Sentinel Sandbox could:
- Intercept syscalls using `ptrace`
- Convert syscall streams into binary feature vectors using temporal bucketing
- Produce anomaly scores using a dual-discriminator DWN (Normal vs Attack)

However, before turning scores into decisions, it was necessary to **understand their statistical behavior**.

---

## Problem
Raw anomaly scores:
- Can vary widely in magnitude
- May overlap between normal and abnormal executions
- Are difficult to interpret without distribution analysis

Blindly applying thresholds at this stage would risk:
- High false positives
- Unstable detection behavior

---

## Approach
Performed **score distribution analysis** using real syscall traces.

### Steps Taken
1. Collected syscall traces from:
   - Normal interactive shell activity
   - Abnormal syscall-intensive workloads
2. Ran both traces through the full Sentinel pipeline
3. Recorded:
   - Normal discriminator responses
   - Attack discriminator responses
   - Final anomaly scores (Normal − Attack)
4. Compared statistical properties across trace types

---

## Observations
- Normal executions produced predominantly **positive anomaly scores**
- Abnormal executions shifted scores toward **negative values**
- Significant variance was observed, especially under syscall-heavy workloads
- Despite variance, a **distribution shift** between normal and abnormal behavior was visible

This confirmed that the model was learning **behavioral differences**, but required calibration.

---

## Key Insight
> Anomaly scoring is meaningful only when interpreted relative to a baseline distribution.

This reinforced the need for **statistical threshold calibration**, rather than hard-coded or heuristic decision rules.

---

## Outcome
- Verified that the DWN produces usable anomaly signals
- Identified variance characteristics of syscall-based scoring
- Established readiness for threshold-based classification (Day 12)

---

## Limitations
- Small sample size
- No formal false-positive analysis
- Scores evaluated qualitatively, not quantitatively

---

## Status
<span style="color:#39FF14; font-weight:bold;">Completed</span>
