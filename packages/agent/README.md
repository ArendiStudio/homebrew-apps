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
utlt agent codex
```

Use `utlt agent --version` to print the installed agent package version.

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
