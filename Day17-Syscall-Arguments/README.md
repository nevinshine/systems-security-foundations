# Day 17: Syscall Argument Inspection

## Objective
Move beyond 'Syscall ID' (RAX) and start reading 'Arguments' (RDI, RSI, RDX).

## The Problem
Sentinel v0.7 only sees "openat".
Sentinel v0.8 must see "openat /etc/shadow".

## Research Plan
1. **Understand the ABI:** Map registers to arguments on x86_64.
2. **The Memory Gap:** Why we can't just read the pointer in RSI.
3. **PTRACE_PEEKDATA:** The mechanism to read child memory word-by-word.

## Next Steps
* Write 'inspector.c' to print file paths.

