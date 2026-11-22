cask "neati" do
  version "0.3.133"
  sha256 "7512e52e46db8164de2a151e055944eb20fff5fc4d8bdcdc15d0bd533c1bf72c"

  url "https://github.com/jaeyoung0509/neati/releases/download/v#{version}/neati-macos-arm64.dmg"
  name "neati"
  desc "Developer storage cleaner with process, port and AI usage views"
  homepage "https://github.com/jaeyoung0509/neati"

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "neati.app"

  uninstall launchctl: "com.neati.desktop.login",
            quit:      "com.neati.desktop"

  zap trash: [
    "~/Library/Application Support/com.neati.desktop",
    "~/Library/Caches/com.neati.desktop",
    "~/Library/LaunchAgents/com.neati.desktop.login.plist",
    "~/Library/Logs/com.neati.desktop",
    "~/Library/Preferences/com.neati.desktop.plist",
    "~/Library/Saved Application State/com.neati.desktop.savedState",
    "~/Library/WebKit/com.neati.desktop",
  ]

  caveats <<~EOS
    neati is a public beta and is not notarized with an Apple Developer ID.
    macOS blocks the first launch. To open it:

      1. Open neati once and dismiss the warning.
      2. Go to System Settings > Privacy & Security and choose "Open Anyway".

    Verify the download first if you prefer:
      gh attestation verify "$(brew --cache)"/downloads/*neati-macos-arm64.dmg --repo jaeyoung0509/neati
  EOS
end
