# UTLT agent onboarding for humans: summary

This is the 80/20 guide for early-access operators trying `agent@3-alpha` in a
test project. Use a repository or project folder you are comfortable letting
agent workers modify.

Run project commands from the project root unless a step says otherwise.

For the detailed workflow, lane policy, project state layout, and full
worker/reviewer handoff graph, see
[onboarding-human-full.md](onboarding-human-full.md).

## Index

- [Summary](#summary)
- [Setup journey](#setup-journey)
  - [Step 1. Install the `utlt` launcher](#step-1-install-the-utlt-launcher)
  - [Step 2. Install the `agent@3-alpha` package](#step-2-install-the-agent3-alpha-package)
  - [Step 3. Initialize agent state inside your project](#step-3-initialize-agent-state-inside-your-project)
  - [Step 4. Launch the coordinator](#step-4-launch-the-coordinator)
  - [Step 5. Add task observability](#step-5-add-task-observability)
  - [Step 6. Add agent observability](#step-6-add-agent-observability)
- [Actions](#actions)
  - [Use the coordinator to capture work](#use-the-coordinator-to-capture-work)
  - [Inspect work before merge](#inspect-work-before-merge)
  - [Stop all agent sessions](#stop-all-agent-sessions)
- [Quick lane path](#quick-lane-path)
- [Quick worker/reviewer loop](#quick-workerreviewer-loop)
- [Full guide](#full-guide)

## Summary

Use `agent@3-alpha` when a request should become durable, observable work:
tasks, worker sessions, reviewer sessions, task worktrees, evidence, review,
and merge state. For one-off questions, normal Codex is usually simpler.

The practical loop is:

1. Install `utlt`, the Arendi app launcher and package manager.
2. Install the `agent@3-alpha` package.
3. Initialize agent state inside a project folder.
4. Launch the coordinator.
5. Optionally watch tasks and live agents in separate terminals.
6. Use the coordinator to capture tasks and route work.
7. Inspect reviewed work before merge.

## Setup journey

`utlt` and `agent@3-alpha` are separate pieces. You need both.

- `utlt` is not the agent. It is the Arendi app launcher and package manager.
- `agent@3-alpha` is not the launcher. It is the agent package installed by
  `utlt`.
- Homebrew is the install channel for `utlt` on macOS and Linux; it is not the
  product you use day to day.
- After both are installed, commands like `utlt agent init` use the
  `agent@3-alpha` package through the `utlt` launcher.

### Step 1. Install the `utlt` launcher

Required if this machine does not have `utlt` yet. Start with the
[root README install guide](../../README.md#install). That guide walks through
the Homebrew-based install path for getting `utlt` onto this machine.

If this machine already has `utlt`, update the launcher:

```bash
utlt update utlt
```

### Step 2. Install the `agent@3-alpha` package

Required. This installs the package that provides the `utlt agent` commands.

Install the agent package:

```bash
utlt install agent@3-alpha --install-dependencies
```

`agent@3-alpha` is the package that adds agent orchestration: the coordinator,
task board, worker sessions, reviewer sessions, evidence, and merge tracking.

If you already installed `agent@3-alpha` earlier and only want to refresh it,
use:

```bash
utlt update agent@3-alpha --install-dependencies
```

### Step 3. Initialize agent state inside your project

Required for each project that will use `agent@3-alpha`.

Move into a test project:

```bash
cd /path/to/test-project
```

Initialize `agent@3-alpha` for this project:

```bash
utlt agent init
```

This is required before the [coordinator](#step-4-launch-the-coordinator),
[task board](#step-5-add-task-observability), workers, and reviewers can
operate in a project. It creates project-local state under `.arendi/corev3`:

```text
.arendi/corev3/
  lanes.toml
  settings.toml
  tasks/
  events/
  agents/
  sessions/
  worktrees/
  daemon/
  observe/
```

The important part is
[`worktrees/`](onboarding-human-full.md#worktrees). Each task gets its own Git
worktree there, so you can inspect the actual files a worker changed before
anything is merged.

### Step 4. Launch the coordinator

Required. The coordinator is the main session you talk to.

```bash
utlt agent codex
```

Use it like a normal Codex session, but treat it as the main UX for creating
and refining tasks, routing worker sessions, answering status questions, and
merging reviewed work.

By default, automation can run up to five worker tasks in `in_progress` and five
reviewer tasks in `in_review` at the same time. Each task that reaches review
gets a reviewer session.

### Step 5. Add task observability

Optional, but recommended. Open this in a second terminal window or tab.

```bash
utlt agent observe tasks
```

It shows lanes, task details, checklists, evidence, review status, and merge
readiness. Use the arrow keys to move through tasks and press Enter to open
task details.

### Step 6. Add agent observability

Optional. Open this in a third terminal window or tab if you want to watch live
worker and reviewer panes.

```bash
utlt agent observe agents
```

Do not type into worker or reviewer panes; ask the
[coordinator](#step-4-launch-the-coordinator) to manage workers and reviewers.

## Actions

### Use the coordinator to capture work

Use the [coordinator](#step-4-launch-the-coordinator) to turn messy intent into
durable task state. You can paste notes, action items, bug reports, or a rough
goal. The coordinator parses the request, asks for clarification when needed,
and records tasks with titles, descriptions, acceptance criteria, checklists,
lane state, claims, evidence, review state, and merge state.

Good coordinator prompts:

```text
Capture these action items as reviewed tasks and start the first one.
```

```text
Create tasks for the onboarding copy cleanup, keep the docs user-facing, and
route each task through review.
```

```text
Show me what is in progress, what is blocked, and what is ready to merge.
```

### Inspect work before merge

Before merging, inspect the task worktree. The easiest path is usually Finder
or your Linux file manager:

#### Finder or file manager

```bash
open .arendi/corev3/worktrees
```

```bash
xdg-open .arendi/corev3/worktrees
```

If `.arendi` is hidden, show hidden files first. In macOS Finder, press
`Shift + Cmd + .`. In most Linux file managers, press `Ctrl + H`.

Open the task folder, such as `t-0001`, review the files the worker changed,
and run the project checks from that task worktree before merge.

#### Terminal path

```bash
ls .arendi/corev3/worktrees
```

```bash
cd .arendi/corev3/worktrees/t-0001
```

```bash
git status --short
```

Replace `t-0001` with the task worktree you want to QA. The
[task board](#step-5-add-task-observability) shows which task is ready for
review or merge. Merge only after the task has evidence, a reviewer pass, and
worktree checks that match the project.

### Stop all agent sessions

Use this as the agent-session kill switch when you want to close all running
agent sessions for the project:

```bash
utlt agent stop all
```

## Quick lane path

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

## Quick worker/reviewer loop

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

See [Worker and reviewer cycle](onboarding-human-full.md#worker-and-reviewer-cycle)
for the complete handoff graph.

## Full guide

Use [onboarding-human-full.md](onboarding-human-full.md) when you need:

- the full install and update walkthrough
- the `.arendi/corev3` folder structure
- lane meanings and default lane behavior
- `lanes.toml` policy sections
- the full worker/reviewer handoff graph
- worktree, merge, and troubleshooting details
