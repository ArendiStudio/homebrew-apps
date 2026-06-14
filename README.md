# Arendi package manager: utlt

`utlt` is the launcher and package manager for Arendi apps and products. Use it
to install, update, and run Arendi product packages such as `agent@3-alpha`.

`utlt` is not the agent. The agent is one package that `utlt` can install.

Setup has two layers:

1. Install `utlt` itself. This tap currently uses Homebrew for that step.
2. Use `utlt` to install Arendi product packages.

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
  - [Step 5. Install a package with `utlt`](#step-5-install-a-package-with-utlt)
- [Command reference](#command-reference)
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

### → Step 5. Install a package with `utlt`

Now that the `utlt` launcher is installed, use it to install the product package
you want to try. Most users should keep `--install-dependencies`; it lets `utlt`
check for package dependencies and install anything missing.

<table>
  <thead>
    <tr>
      <th width="25%">Package</th>
      <th width="75%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td>
        <p>
          Multi-agent orchestration for Codex-based project work. Use this
          package when you want a task board, worker sessions, reviewer
          sessions, saved evidence, and tracked merge state instead of one long
          chat thread.
        </p>
        <p>Install it:</p>
        <pre><code>utlt install agent@3-alpha --install-dependencies</code></pre>
        <p>
          Then continue to the
          <a href="packages/agent/onboarding.md">agent onboarding guide</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>agent@4-alpha</code></td>
      <td>
        <p>
          Available soon for early access, starting as harness-agnostic durable
          task context.
        </p>
        <p>No install command yet. Onboarding guide: coming soon.</p>
      </td>
    </tr>
  </tbody>
</table>

If you already manage package dependencies yourself, remove
`--install-dependencies` from package install and update commands.

See all agent versions: [agent](packages/agent/).

<br>

## Command reference

After `utlt` is installed, these are the common launcher and package commands.
Package-specific runtime commands live in each package's docs.

| Goal | Command |
| --- | --- |
| Show update targets | `utlt update list` |
| Update the `utlt` launcher | `utlt update utlt` |
| Install a package track | `utlt install <package>@<track> --install-dependencies` |
| Update a package track | `utlt update <package>@<track> --install-dependencies` |
| Show installed package state | `utlt packages` |
| Show package help | `utlt help <package>` |
| Uninstall a package | `utlt uninstall <package>` |

<br>

## Upgrade

### Upgrade `utlt`

###### macOS & Linux

```bash
utlt update utlt
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
utlt update <package>@<track> --install-dependencies
```

Package update refreshes the active package payload to the current version for
that track. Add `--install-dependencies` when you want `utlt` to check and
install missing package dependencies too.

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

Uninstalling `utlt` removes the launcher installed through Homebrew. It does not
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
