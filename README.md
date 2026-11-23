# homebrew-neati

Homebrew tap for [neati](https://github.com/jaeyoung0509/neati), a developer
storage cleaner for Apple Silicon Macs.

```bash
brew install --cask jaeyoung0509/neati/neati
```

Homebrew asks before loading casks from a third-party tap. If it refuses with
"untrusted tap", review [`Casks/neati.rb`](Casks/neati.rb) and run
`brew trust jaeyoung0509/neati`, then install again.

neati is a public beta and is not notarized with an Apple Developer ID. macOS
blocks the first launch: open the app once, then choose **Open Anyway** in
System Settings → Privacy & Security. Removing the quarantine attribute by hand
is not recommended; the prompt is the system's own check.

The cask installs the DMG published on the matching
[GitHub release](https://github.com/jaeyoung0509/neati/releases). Each release
carries SHA256 checksums and a GitHub build provenance attestation. After
installation the app can update itself from Settings → Updates.

From 0.3.134 the cask also links the `neati` command (the app's own binary):

```bash
neati status        # free space, memory, last cleanup
neati clean         # preview what one-button Clean removes
neati clean --yes   # permanently remove that set
neati skill install # agent skill for Claude Code (--target codex for Codex)
```

Open the app once first so macOS has approved it before the command runs.

```bash
brew uninstall --cask neati
```
