# agent

Early-access Arendi agent package installed by `utlt`.

## Install

```bash
utlt install agent@3-alpha --install-dependencies
```

`--install-dependencies` checks required Homebrew dependencies, skips anything
already installed, and installs only what is missing. Omit it if you want to
manage dependencies yourself.

Required Homebrew dependencies:

| Type | Name |
| --- | --- |
| Formula | `git` |
| Formula | `tmux` |
| Cask | `codex` |

## Run

```bash
utlt agent init
```

```bash
utlt agent codex
```

Use `utlt agent --version` to print the installed agent package version.

For a first project walkthrough, see [onboarding.md](onboarding.md).

## Uninstall

```bash
utlt uninstall agent
```

## Released versions

<table>
  <thead>
    <tr>
      <th width="16%">Track</th>
      <th width="18%">Version</th>
      <th width="36%">Install command</th>
      <th width="30%">Changelog</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.51-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>fix:</code> treat a session-less tmux server as a missing session during launch probes.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.50-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>fix:</code> validate the current tmux client before switching attach targets.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.49-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>fix:</code> attach when the launch tmux socket differs from the current shell.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.47-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>fix:</code> prune merge source worktrees after release work.</li>
          <li><code>fix:</code> tolerate a missing current tmux target during <code>utlt attach</code>.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.45-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>fix:</code> require full-loop completion for sandbox task-agent flows.</li>
          <li><code>fix:</code> restore workspace-write task agents and avoid nested Codex sandbox launches.</li>
          <li><code>fix:</code> reject ambiguous merge-repair worker proposals and ignore checkout metadata noise.</li>
          <li><code>fix:</code> label feedback report origins and refresh Codex model update labels.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.38-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>fix:</code> harden task-agent lifecycle reuse, replacement, and diagnostics.</li>
          <li><code>fix:</code> harden mounted-volume and UTLT launch environments.</li>
          <li><code>fix:</code> make feedback posting destination-safe and live-configurable.</li>
          <li><code>fix:</code> remove private path detector literals from packaged binaries.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.33-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>feat:</code> add reviewed feedback drafts for bug and feature reports.</li>
          <li><code>fix:</code> remove private temporary path placeholders from packaged binaries.</li>
          <li><code>fix:</code> keep issue posting guarded behind explicit operator approval.</li>
          <li><code>fix:</code> harden task-agent sandbox launch and reviewer checkout visibility.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>agent@3-alpha</code></td>
      <td><code>3.1.25-alpha</code></td>
      <td><code>utlt install agent@3-alpha --install-dependencies</code></td>
      <td>
        <ul>
          <li><code>fix:</code> remove local build-path embedding from the packaged agent binary.</li>
          <li><code>fix:</code> publish sanitized macOS and Linux package artifacts.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
