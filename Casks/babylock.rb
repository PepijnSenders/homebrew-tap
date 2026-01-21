cask "babylock" do
  version "1.2.1"
  sha256 "bf58a6266c847795dfb971b55ae847416b642d74f19c157e020b29f169814d40"

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
