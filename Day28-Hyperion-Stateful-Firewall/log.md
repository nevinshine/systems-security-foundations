# Day 28: Hyperion M2 (Stateful Firewall)

**Objective:** Implement state tracking using eBPF Maps.

## Activities
1.  Defined `BPF_MAP_TYPE_LRU_HASH` to store Flow States (IP -> Packet Count).
2.  Implemented atomic counters using `__sync_fetch_and_add`.
3.  Added Rate Limiting logic (Threshold: 10 packets).
4.  Simulated a DDoS attack using `ping -f` and verified automatic blocking.

**Outcome:** M2 Complete. Firewall is now stateful and can mitigate volumetric attacks.
