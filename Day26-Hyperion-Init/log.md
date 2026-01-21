# Day 26: Hyperion Project Initialization

**Objective:** Set up the eBPF/XDP development environment.

## Activities
1.  Installed `clang`, `llvm`, `libbpf-dev`, and `bpftool`.
2.  Configured the project structure (`src/kern`, `src/user`).
3.  Verified kernel compatibility using `bpftool btf dump file /sys/kernel/btf/vmlinux`.
4.  Created the initial `Makefile` for BPF bytecode compilation.

**Outcome:** Environment ready. Hello World XDP program compiles successfully.
