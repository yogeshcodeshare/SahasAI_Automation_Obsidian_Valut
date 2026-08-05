---
title: Three-agent worktree + HANDOFF workflow
created: 2026-08-02
tags: [pattern, workflow, git, multi-agent, methodology, gmb-sarathi]
source: GMB Sarathi 7-day build (Claude Code, MAIN agent)
origin: ai
author: claude-code
maturity: supported
---

# Three-agent worktree + HANDOFF workflow

The build methodology used for GMB Sarathi: three Claude agents working in parallel git worktrees,
coordinated through a file-based channel, with one integrator gatekeeping every merge. Reusable for
any multi-agent build in the agency.

## Roles + folder ownership
- **MAIN** (tech lead + DevOps + integrator): owns `src/types/**`, `supabase/**`, `docs/**`,
  `.github/**`. The ONLY agent that merges to `main`. Locks contracts, gates + merges PRs, arbitrates.
- **BACKEND** (branch `agents/backend`): owns `src/server/**` + `app/api/**`.
- **FRONTEND** (branch `agents/frontend`): owns `app/(dashboard)/**`, `app/public/**`, `components/**`.
- `src/lib/**` is shared (additive-only with a handoff note; MAIN arbitrates).

## Mechanics
- Each agent works in its own **git worktree** (isolated checkout of one branch) → true parallelism, no cross-talk.
- **`docs/agents/HANDOFF.md`** is the async channel: append-only, newest-on-top, `@main/@backend/@frontend`
  addressing. MAIN reads it at merge time and relays/acts. (Append-only → merges always conflict there;
  resolve by keeping both notes.)
- **Contract-first:** MAIN locks shared types in `@/types` + `API_CONTRACT.md` BEFORE agents build.
  If an agent builds against an old contract, its code drifts on typecheck — MAIN bounces it back
  with the exact errors rather than merging red.
- **Gate before merge:** typecheck + lint + tests + build must be green; MAIN dry-run-merges each
  branch, verifies, then fast-forwards `main` and pushes.

## Hard lessons
- **Verify merge state with `git merge-base --is-ancestor <sha> main`, never from an agent's EOD summary** —
  an agent can push more commits after you gated an earlier HEAD.
- Fully-merged worktrees are disposable, but if you relocate them, run `git worktree repair`.
- Keep the integrator's claims falsifiable: paste real gate numbers + SHAs, not "all green".

See project [[gmb-sarathi]].
