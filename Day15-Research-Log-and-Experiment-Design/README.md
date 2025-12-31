# Day 15: Research Log & Experiment Design

## Objective
Transition from implementation-focused work to structured security research
by introducing formal research logs and experiment planning.

---

## Why This Matters

Building a system proves engineering skill.  
Documenting *why it works* proves research maturity.

From this day onward, every major change must answer:
- What hypothesis am I testing?
- What evidence supports or rejects it?

---

## Research Log Structure

Each experiment will be documented using this template:

### Experiment ID
Example: EXP-001

### Hypothesis
What behavior do I expect and why?

### Setup
- Dataset / syscall source
- Window size
- Feature encoding parameters

### Execution
Which script was run and how.

### Observation
Raw outcomes (scores, logs, failures).

### Interpretation
What this means for anomaly detection.

---

## Initial Research Questions

1. How sensitive is Sentinel to window size?
2. Does syscall order matter more than frequency?
3. How stable are anomaly thresholds across machines?
4. Can normal-only training generalize to unseen benign workloads?

---

## Outcomes Today

- Defined formal research logging structure
- Shifted mindset from DevOps → Security Research
- Locked Sentinel Sandbox as the experimental platform

---

## Status
Day completed successfully.
