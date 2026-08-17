---
name: code-testing
description: Use for every code change to decide whether tests are warranted, and when writing, modifying, or reviewing tests.
---

## Testing Phase

During exploratory or unapproved iterations, defer writing, running, and fixing tests unless explicitly requested. Keep deferred testing pending and mention it briefly in the handoff.

Apply the strategy below whenever testing is not deferred. Resume deferred testing after explicit approval or a request to finalize, before completing the work. If the phase is unclear, ask before test work.

## Testing Strategy

Optimize for confidence per test, not test count or coverage.

Add the smallest set of tests that meaningfully reduces risk. Focus on observable behavior where failure is plausible or costly: critical paths, complex logic, boundaries, error paths, contracts, invariants, and regressions for meaningful bugs.

Choose representative cases instead of exhaustive permutations.

For test-worthy changes, prefer TDD: start with a focused failing test.

Skip tests that duplicate existing coverage, verify obvious code or implementation details, or retest guarantees owned by the language, libraries, or framework. Do not add low-value tests solely to raise coverage.

Consolidate obvious redundancy only near changed code. If omitting tests for a change that appears risky, briefly explain why.
