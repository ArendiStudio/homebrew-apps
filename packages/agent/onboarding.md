# UTLT Agent Onboarding

This guide is for early-access operators trying `agent@3-alpha` in a test
project. Use a repository or project folder you are comfortable letting agent
workers modify.

Run project commands from the project root unless a step says otherwise.

## Install

Install Homebrew first if it is not already installed.

###### macOS & Linux

Follow the official installer at [brew.sh](https://brew.sh/).

Add and trust the Arendi apps tap:

```bash
brew tap arendistudio/apps
```

```bash
brew trust --tap arendistudio/apps
```

Install `utlt`:

```bash
brew install arendistudio/apps/utlt
```

On macOS, clear quarantine after installing or upgrading `utlt`:

```bash
xattr -dr com.apple.quarantine "$(brew --prefix utlt)" 2>/dev/null || true
```

Install the agent package and its Homebrew dependencies:

```bash
utlt install agent@3-alpha --install-dependencies
```

Run Codex once if you have not signed in on this machine:

```bash
codex
```

## Update

Refresh available versions:

```bash
brew update
```

Show update targets:

```bash
utlt update list
```

Update `utlt`:

```bash
utlt update utlt
```

Update and activate the agent package:

```bash
utlt update agent@3-alpha --install-dependencies
```

Verify the active package:

```bash
utlt packages
```

```bash
utlt agent --version
```

```bash
utlt agent version
```

## Start A Test Project

Move into a test repository or project folder:

```bash
cd /path/to/test-project
```

Initialize agent state:

```bash
utlt agent init
```

This creates local runtime state under:

```text
.arendi/corev3
```

Task state, agent state, sessions, and task worktrees are stored there.

## Run The Coordinator

Open the main coordinator from the project root:

```bash
utlt agent codex
```

Use this like a normal Codex CLI session. The coordinator can create durable
tasks, route work to worker sessions, and send review work to reviewer sessions.

## Watch Tasks

Open a second terminal window or pane from the same project root:

```bash
utlt agent observe tasks
```

This opens the task board. Use the arrow keys to navigate between the task
index and task detail views.

## Watch Agents

Open a third terminal window or pane from the same project root:

```bash
utlt agent observe agents
```

This shows live worker and reviewer sessions.

Do not type directly into worker or reviewer panes. Those panes are
automation-owned. If you need something from a worker or reviewer, ask the
coordinator to manage the sub-agent.

## Worktrees

Each task gets its own Git worktree under:

```text
.arendi/corev3/worktrees
```

On macOS Finder, press:

```text
Shift + Cmd + .
```

to show hidden folders.

## Merging

The coordinator handles merge routing. When tasks are ready, ask the coordinator
which tasks can be merged.

Example prompt:

```text
Merge tasks T-0001, T-0002, and T-0003 when they are ready.
```

## Stop Sessions

Stop all UTLT agent sessions:

```bash
utlt agent stop all
```

Task context remains saved.

## More Commands

Show featured agent commands:

```bash
utlt help agent
```

Show the full agent command list:

```bash
utlt agent advanced
```

Show the active package record:

```bash
utlt agent active --json
```

## Troubleshooting

If an agent command says there is no project or no current target, confirm you
are in the folder where you ran:

```bash
utlt agent init
```

Then check the active package:

```bash
which -a utlt
```

```bash
utlt --version
```

```bash
utlt agent --version
```

```bash
utlt agent active --json
```

```bash
utlt agent version
```

If `utlt update agent@3-alpha` does not see the latest public package, refresh
the local Homebrew tap and retry:

```bash
brew update
```

```bash
utlt update agent@3-alpha --install-dependencies
```

If the local Homebrew tap checkout is conflicted or stuck, repair it once:

```bash
curl -fsSL https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/scripts/repair-local-tap | bash
```

Then retry the agent update:

```bash
utlt update agent@3-alpha --install-dependencies
```
