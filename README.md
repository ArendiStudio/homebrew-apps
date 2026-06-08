# Arendi package manager: utlt

`utlt` is the package manager and launcher for Arendi products. Homebrew
installs `utlt`. `utlt` installs Arendi packages.

`utlt` and its packages are early-access proprietary software. Do not install or
run them unless you know me or have been directly invited to test them. Use them
at your own risk.

`utlt` currently publishes Homebrew artifacts for Apple Silicon macOS, Linux
arm64, and Linux x86_64. Windows is not currently supported.

<br>

## Install

### Step 1. Install Homebrew

Skip if you already have Homebrew installed.

```bash
# macOS & Linux
https://brew.sh/

# Windows
# N/A
```

### Step 2. Add the apps tap

```bash
# macOS & Linux
brew tap arendistudio/apps
brew trust --tap arendistudio/apps

# Windows
# N/A
```

### Step 3. Install `utlt`

```bash
# macOS & Linux
brew install arendistudio/apps/utlt

# Windows
# N/A
```

### Step 4. Optional: clear macOS quarantine if blocked

```bash
# macOS
xattr -dr com.apple.quarantine "$(brew --prefix utlt)" 2>/dev/null || true

# Linux
# No action required

# Windows
# N/A
```

### Step 5. Install `utlt` packages

```bash
# macOS & Linux
utlt install <package>@<track> --install-dependencies

# Windows
# N/A
```

Use `--install-dependencies` to let `utlt` check required Homebrew
dependencies, skip anything already installed, and install only what is missing.
Omit it if you want to manage package dependencies yourself.

<br>

#### Active packages

<table>
  <thead>
    <tr>
      <th width="22%">Package</th>
      <th width="78%">Details</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3"><code>agent@3-alpha</code></td>
      <td><strong>What it is:</strong> Multi-agent orchestration with observable, durable task context for Codex harness.</td>
    </tr>
    <tr>
      <td><strong>Status:</strong> Feature frozen, bug/hot fixes only.</td>
    </tr>
    <tr>
      <td>
        <strong>Install:</strong>
        <pre><code>utlt install agent@3-alpha --install-dependencies</code></pre>
      </td>
    </tr>
    <tr>
      <td rowspan="2"><code>agent@4-alpha</code></td>
      <td><strong>What it is:</strong> Evolution and hardening of <code>agent@3-alpha</code> fundamentals.</td>
    </tr>
    <tr>
      <td><strong>Status:</strong> Available soon for early access, starting as harness-agnostic durable task context.</td>
    </tr>
  </tbody>
</table>

See all versions: [agent](packages/agent/).

<br>

## Upgrade

### Upgrade `utlt`

```bash
brew update
brew upgrade arendistudio/apps/utlt
```

### Upgrade packages

```bash
utlt install <package>@<track> --install-dependencies
```

Rerunning package install updates the active package payload to the current
version for that track. Add `--install-dependencies` when you want `utlt` to
check and install missing package dependencies too.

<br>

## Reinstall

### Reinstall `utlt`

```bash
brew reinstall arendistudio/apps/utlt
```

### Reinstall packages

```bash
utlt install <package>@<track>
```

<br>

## Uninstall

### Uninstall packages

```bash
utlt uninstall <package>
```

Package uninstall removes `utlt`-managed installed builds and active package
state for that package. It does not remove `utlt` itself.

### Uninstall `utlt`

```bash
brew uninstall arendistudio/apps/utlt
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
