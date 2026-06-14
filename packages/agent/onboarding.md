# UTLT Agent Onboarding

This is the 80/20 guide for early-access operators trying `agent@3-alpha` in a
test project. Use a repository or project folder you are comfortable letting
agent workers modify.

Run project commands from the project root unless a step says otherwise.

For the detailed workflow, lane policy, project state layout, and full
worker/reviewer handoff graph, see [onboarding-full.md](onboarding-full.md).

## Index

- [Summary](#summary)
- [Quick Start](#quick-start)
- [Quick Lane Path](#quick-lane-path)
- [Quick Worker/Reviewer Loop](#quick-workerreviewer-loop)
- [Full Guide](#full-guide)

## Summary

Use `agent@3-alpha` when a request should become durable, observable work:
tasks, worker sessions, reviewer sessions, task worktrees, evidence, review,
and merge state. For one-off questions, normal Codex is usually simpler.

The practical loop is:

1. Start from a test project.
2. Initialize ACV3 state.
3. Open the coordinator.
4. Watch tasks and live agents in separate terminals.
5. Let workers edit task worktrees.
6. Let reviewers inspect evidence and committed diffs.
7. Merge only reviewed work.

## Quick Start

Start based on the state of this machine.

Fresh install: if `utlt` is not installed yet, follow the
[root README install guide](../../README.md#install). If you just installed
`utlt` and `agent@3-alpha` from that guide, skip the update commands below and
continue to project setup.

Existing install: refresh the launcher first:

```bash
utlt update utlt
```

Then refresh and activate the agent package:

```bash
utlt update agent@3-alpha --install-dependencies
```

Project setup:

Move into a test project:

```bash
cd /path/to/test-project
```

Initialize ACV3 state:

```bash
utlt agent init
```

Open the coordinator:

```bash
utlt agent codex
```

Open the task board in a second terminal:

```bash
utlt agent observe tasks
```

Open live worker/reviewer panes in a third terminal:

```bash
utlt agent observe agents
```

Stop all agent sessions when finished:

```bash
utlt agent stop all
```

## Quick Lane Path

This is the outer task-board workflow. You see these lanes in
`utlt agent observe tasks`; they describe where one task is in the delivery
process.

```mermaid
flowchart TD
  Backlog["backlog<br/>future work"]
  Todo["to_do<br/>ready to start"]
  Progress["in_progress<br/>worker owns implementation"]
  Review["in_review<br/>reviewer checks the work"]
  MergeReady["merge_ready<br/>passed review"]
  Done["done<br/>merged locally"]
  Pushed["pushed_remote<br/>remote push recorded"]

  Backlog -->|"ready"| Todo
  Todo -->|"pickup"| Progress
  Progress -->|"handoff gates pass"| Review
  Review -->|"pass"| MergeReady
  Review -->|"fail + retry"| Progress
  MergeReady -->|"merge"| Done
  Done -->|"push"| Pushed
```

## Quick Worker/Reviewer Loop

This is the inner loop for a task after it reaches implementation. The
coordinator routes work, the worker changes the task worktree, and the reviewer
checks the evidence and committed diff before merge.

```mermaid
flowchart TD
  Coordinator["Coordinator<br/>creates/refines task"]
  Worker["Worker<br/>uses worktree + checklist"]
  Evidence["Evidence + task branch commit"]
  Review["Reviewer<br/>checks evidence + diff"]
  Merge["Merge ready"]
  Done["Done / pushed"]

  Coordinator --> Worker
  Worker --> Evidence
  Evidence --> Review
  Review -->|"pass"| Merge
  Review -->|"fail + retry"| Worker
  Merge --> Done
```

See [Worker And Reviewer Cycle](onboarding-full.md#worker-and-reviewer-cycle)
for the complete handoff graph.

## Full Guide

Use [onboarding-full.md](onboarding-full.md) when you need:

- the full install and update walkthrough
- the `.arendi/corev3` folder structure
- lane meanings and default lane behavior
- `lanes.toml` policy sections
- the full worker/reviewer handoff graph
- worktree, merge, and troubleshooting details
