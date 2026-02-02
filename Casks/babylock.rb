cask "babylock" do
  version "1.2.2"
  sha256 "5e2b7317b92fa620ac391181c195d8d6395c2cc546d966c39e1ec3f6ce55d0b7"

  url "https://github.com/PepijnSenders/baby-lock/releases/download/v#{version}/BabyLock-#{version}.dmg"
  name "BabyLock"
  desc "Lock keyboard and mouse input - baby-proof your screen"
  homepage "https://github.com/PepijnSenders/baby-lock"

  depends_on macos: ">= :monterey"

  # Quit app before upgrading
  app "BabyLock.app"

  preflight do
    # Quit the app if running before install/upgrade
    system_command "/usr/bin/osascript",
                   args: ["-e", 'quit app "BabyLock"'],
                   sudo: false
  end

  postflight do
    # Reset TCC database entry to prompt for permission on first launch
    system_command "/usr/bin/tccutil",
                   args: ["reset", "Accessibility", "com.babylock.app"],
                   sudo: false
  end

  caveats <<~EOS
    #{token} requires Accessibility permission to block keyboard/mouse input.

    After installation or upgrade, you'll need to grant permission:
      1. Open System Settings → Privacy & Security → Accessibility
      2. Enable BabyLock in the list (or remove and re-add it)

    This is required because macOS revokes permissions when app binaries change.
  EOS

  zap trash: [
    "~/Library/Preferences/com.babylock.app.plist",
  ]
end
