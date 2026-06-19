# UTLT agent onboarding for AI agents

This file is for AI agents. Use it when a user pastes one of these URLs and
asks you to install or set up the agent package:

```text
https://github.com/ArendiStudio/homebrew-apps
```

```text
https://github.com/ArendiStudio/homebrew-apps/tree/main/packages/agent
```

`utlt` is the Arendi launcher and package manager. `agent@3-alpha` is an
Arendi package installed and run through `utlt`.

Do not clone this repository just to install `utlt` or `agent@3-alpha`. Install
from the official Homebrew tap.

## Install `utlt`

If `brew` is not installed, install Homebrew first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Run these commands on macOS or Linux if `utlt` is not installed:

```bash
brew tap arendistudio/apps
```

```bash
brew trust --tap arendistudio/apps
```

```bash
brew install arendistudio/apps/utlt
```

On macOS, also clear quarantine:

```bash
xattr -dr com.apple.quarantine "$(brew --prefix utlt)" 2>/dev/null || true
```

## Install `agent@3-alpha`

Install or refresh the agent package:

```bash
utlt install agent@3-alpha --install-dependencies
```

`--install-dependencies` lets `utlt` check required package dependencies and
install anything missing.

## Start a project

Run project commands from the project root.

Initialize project-local agent state:

```bash
utlt agent init
```

Launch the coordinator:

```bash
utlt agent codex
```

Optional task board, in a second terminal:

```bash
utlt agent observe tasks
```

Optional live agent observer, in a third terminal:

```bash
utlt agent observe agents
```

Use this as the project-level agent-session kill switch:

```bash
utlt agent stop all
```

## Human docs

Use these files when writing guidance for a human reader:

- [onboarding-human-summary.md](onboarding-human-summary.md)
- [onboarding-human-full.md](onboarding-human-full.md)
