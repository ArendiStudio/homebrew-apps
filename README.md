# Arendi package manager: utlt

`utlt` is the package manager and launcher for Arendi products. Homebrew
installs `utlt`. `utlt` installs Arendi packages.

`utlt` and its packages are early-access proprietary software. Do not install or
run them unless you know me or have been directly invited to test them. Use them
at your own risk.

`utlt` currently publishes Homebrew artifacts for Apple Silicon macOS, Linux
arm64, and Linux x86_64.

## Index

- [Install](#install)
  - [Step 1. Install Homebrew](#step-1-install-homebrew)
  - [Step 2. Add the apps tap](#step-2-add-the-apps-tap)
  - [Step 3. Install `utlt`](#step-3-install-utlt)
  - [Step 4. Clear macOS quarantine](#step-4-clear-macos-quarantine)
  - [Step 5. Choose packages](#step-5-choose-which-utlt-packages-you-want-to-install)
- [Upgrade](#upgrade)
  - [Upgrade `utlt`](#upgrade-utlt)
  - [Upgrade packages](#upgrade-packages)
- [Reinstall](#reinstall)
  - [Reinstall `utlt`](#reinstall-utlt)
  - [Reinstall packages](#reinstall-packages)
- [Uninstall](#uninstall)
  - [Uninstall packages](#uninstall-packages)
  - [Uninstall `utlt`](#uninstall-utlt)
- [Legal disclaimer](#legal-disclaimer)

<br>

## Install

### → Step 1. Install Homebrew

Skip if you already have Homebrew installed.

###### macOS & Linux

Follow the official installer at [brew.sh](https://brew.sh/).

### → Step 2. Add the apps tap

###### macOS & Linux

```bash
brew tap arendistudio/apps
```

```bash
brew trust --tap arendistudio/apps
```

### → Step 3. Install `utlt`

###### macOS & Linux

```bash
brew install arendistudio/apps/utlt
```

### → Step 4. Clear macOS quarantine

###### macOS

```bash
xattr -dr com.apple.quarantine "$(brew --prefix utlt)" 2>/dev/null || true
```

###### Linux

No action required.

### → Step 5. Choose which `utlt` packages you want to install
<small>Remove `--install-dependencies` flag if you want to manage package dependencies yourself.</small>

###### agent@3-alpha - Multi-agent orchestration with observable, durable task context for Codex harness. Feature frozen, bug/hot fixes only.

```bash
utlt install agent@3-alpha --install-dependencies
```

###### agent@4-alpha - Available soon for early access, starting as harness-agnostic durable task context.


See all versions: [agent](packages/agent/).

<br>

## Upgrade

### Upgrade `utlt`

###### macOS & Linux

```bash
brew update
```

```bash
brew upgrade arendistudio/apps/utlt
```

If you tested `utlt` before the early-access tap history reset and Homebrew
shows conflict markers in `Formula/utlt.rb`, repair the local tap checkout once:

```bash
curl -fsSL https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/scripts/repair-local-tap | bash
```

```bash
brew upgrade arendistudio/apps/utlt
```

### Upgrade packages

###### macOS & Linux

```bash
utlt install <package>@<track> --install-dependencies
```

Rerunning package install updates the active package payload to the current
version for that track. Add `--install-dependencies` when you want `utlt` to
check and install missing package dependencies too.

<br>

## Reinstall

### Reinstall `utlt`

###### macOS & Linux

```bash
brew reinstall arendistudio/apps/utlt
```

### Reinstall packages

###### macOS & Linux

```bash
utlt install <package>@<track>
```

<br>

## Uninstall

### Uninstall packages

###### macOS & Linux

```bash
utlt uninstall <package>
```

Package uninstall removes `utlt`-managed installed builds and active package
state for that package. It does not remove `utlt` itself.

### Uninstall `utlt`

###### macOS & Linux

```bash
brew uninstall arendistudio/apps/utlt
```

```bash
brew untap arendistudio/apps
```

Uninstalling `utlt` removes the launcher installed by Homebrew. It does not
necessarily remove package state created under `utlt`-managed directories.

<br>

## Legal disclaimer

`utlt` is proprietary software from Arendi Studio.

Permission is granted to download and use official binary releases of `utlt`
through distribution channels authorized by Arendi Studio, including official
GitHub repositories and authorized Homebrew taps.

No permission is granted to redistribute, mirror, repackage, sublicense, sell,
publish, or otherwise make this software available through any third-party
distribution channel without prior written permission from Arendi Studio.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND. TO THE MAXIMUM
EXTENT PERMITTED BY LAW, ARENDI STUDIO DISCLAIMS ALL WARRANTIES AND SHALL NOT BE
LIABLE FOR ANY CLAIMS, DAMAGES, LOSSES, OR OTHER LIABILITY ARISING FROM OR
RELATED TO THE SOFTWARE OR ITS USE.
