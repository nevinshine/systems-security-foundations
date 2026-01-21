# Day 27: Hyperion M1 (Stateless Filter)

**Objective:** Implement a basic XDP packet filter.

## Activities
1.  Wrote `hyperion_core.c` to parse Ethernet and IPv4 headers.
2.  Implemented a hardcoded drop logic for a specific IP (1.2.3.4).
3.  Attached the XDP hook to the `lo` (Loopback) interface.
4.  Verified drops using `tcpdump` and `ping`.

**Outcome:** Successfully dropped packets at the driver level (XDP_DROP).
