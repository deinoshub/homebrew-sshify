# homebrew-sshify

Homebrew tap for [sshify](https://github.com/deinoshub/sshify).

```bash
brew install deinoshub/sshify/sshify
```

From v0.2.0 the formula installs a **prebuilt binary** (darwin/linux, amd64/arm64). No Go toolchain is required for stable installs. `--HEAD` builds from `main`.

Upgrade:

```bash
brew update
brew upgrade sshify
```

The formula is updated automatically when [sshify](https://github.com/deinoshub/sshify) publishes a `v*` tag (GoReleaser + `hack/publish-tap.sh`).
