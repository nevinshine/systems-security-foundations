# Day 12: Runtime Anomaly Classification (Research)

## Objective
Convert raw anomaly scores from a kernel-level ML model into **actionable security decisions** without labeled attack data.

---

## Context
By Day 11, the Sentinel Sandbox could:
- intercept syscalls using `ptrace`
- encode execution behavior into binary vectors
- score behavior using a CPU-only Weightless Neural Network

However, scores alone are not useful for security operations.

---

## Problem
Anomaly scores lack meaning unless they are:
- calibrated
- comparable
- mapped to decisions

Hard-coded thresholds or supervised labels would undermine robustness.

---

## Solution
Implemented **statistical threshold calibration** using normal-only behavior.

### Steps
1. Run the trained model on normal syscall traces
2. Collect anomaly score distribution
3. Compute mean (μ) and standard deviation (σ)
4. Define severity bands based on deviation

Thresholds are persisted and reused at runtime.

---

## Runtime Classification
Each syscall window is classified as:

- NORMAL
- SUSPICIOUS
- ANOMALOUS
- CRITICAL

based on its anomaly score relative to calibrated thresholds.

This enables real-time behavioral assessment without retraining.

---

## Result
- Majority of windows classified as NORMAL
- Small number flagged as SUSPICIOUS
- Rare ANOMALOUS detections
- No CRITICAL false positives during benign runs

The system now performs **end-to-end behavioral intrusion detection**.

---

## Key Takeaway
> Reliable intrusion detection is achieved through careful feature design and statistical calibration—not deeper models.

---

## Status
✅ Completed
