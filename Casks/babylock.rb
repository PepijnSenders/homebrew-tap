cask "babylock" do
  version "1.2.3"
  sha256 "12dd480c5f31f4aeb42e3af05d1f4315c640b5d47531e7034906b70fe9b5841e"

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
    # Clear quarantine flag to prevent Gatekeeper malware warning (app is unsigned)
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/BabyLock.app"],
                   sudo: false

    # Reset TCC database entry to prompt for permission on first launch
    # must_succeed: false because on fresh installs the app isn't in the TCC database yet
    system_command "/usr/bin/tccutil",
                   args: ["reset", "Accessibility", "com.babylock.app"],
                   sudo: false,
                   must_succeed: false
  end

  caveats <<~EOS
    #{token} requires Accessibility permission to block keyboard/mouse input.

    After installation or upgrade, you'll need to grant permission:
      1. Open System Settings → Privacy & Security → Accessibility
      2. Enable BabyLock in the list (or remove and re-add it)

    This is required because macOS revokes permissions when app binaries change.

    To launch the app:
      open -a BabyLock
  EOS

  zap trash: [
    "~/Library/Preferences/com.babylock.app.plist",
  ]
end
