# packages

Package manifests for the farm3 CLI — macOS, Linux, and Windows.

## Install

**macOS / Linux (Homebrew):**
```bash
brew tap farm3network/packages https://github.com/farm3network/packages
brew install farm3
```
(The full URL is required here — Homebrew's `brew tap user/repo` shorthand
only auto-resolves for repos named `homebrew-<repo>`, and this repo is
intentionally just `packages` so it can also hold the Windows/Scoop manifest.)

**Windows (Scoop):**
```powershell
scoop bucket add farm3network https://github.com/farm3network/packages
scoop install farm3network/farm3
```

## Run

One command family per role. Public needs no private flags; private adds
`-network` / `-psk` / `-private-relay` (provider and consumer) and a matching
private relay multiaddr + PSK.

### Public

```bash
farm3 run provider
farm3 run consumer
```

Optional public relay override:

```bash
farm3 run provider -relay "<multiaddr>"
farm3 run consumer -relay "<multiaddr>"
```

### Private

Use the same `-network`, `-psk`, and `-private-relay` on provider and consumer:

```bash
farm3 run provider -network myorg -psk "$MYORG_PSK" -private-relay "$PRIVATE_RELAY"
farm3 run consumer -network myorg -psk "$MYORG_PSK" -private-relay "$PRIVATE_RELAY"
```

### Flag reference

| Command | What it does |
|---|---|
| `farm3 run provider` | Join the public Farm3 network as a provider (default) |
| `farm3 run consumer` | Join the public Farm3 network as a consumer (default) |
| `farm3 run provider -relay "<multiaddr>"` | Connect to a specific public relay instead of the default |
| `farm3 run provider -network "<id>" -psk "<base64>" -private-relay "<multiaddr>"` | Join a private network as a provider |
| `farm3 run consumer -network "<id>" -psk "<base64>" -private-relay "<multiaddr>"` | Join a private network as a consumer |
| `farm3 run provider -h` / `farm3 run consumer -h` | Full flag reference |

## Upgrade / uninstall

```bash
# Homebrew
brew upgrade farm3
brew uninstall farm3

# Scoop
scoop update farm3network/farm3
scoop uninstall farm3network/farm3
```

## How it works

`farm3` is a thin dispatcher: it execs/spawns into the `farm3-provider` /
`farm3-consumer` binaries installed alongside it (via `brew install farm3` or
`scoop install`), forwarding all flags untouched. So `farm3 run provider
<flags>` behaves exactly like running the underlying provider binary
directly.

## Platform notes

- **macOS / Linux**: fully supported, both arm64 and amd64/intel.
- **Windows**: the CLI dispatcher and cross-compiled binaries are built and
  packaged for amd64 and arm64, but device-control flows that shell out to
  platform tools (e.g. `adb`, `go-ios`) have not yet been verified on
  Windows. Treat Windows support as CLI-level for now.

## Maintainers

Formula/manifest version and checksums are bumped manually per release.
Release archives are mirrored here as public GitHub Releases by CI.
