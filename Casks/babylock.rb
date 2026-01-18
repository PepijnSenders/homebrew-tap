cask "babylock" do
  version "1.1.2"
  sha256 "3020d7f030d13ee7b0bca9fc72cfb60ec3cc5ac818ad3e31968d97531d677130"

  url "https://github.com/PepijnSenders/baby-lock/releases/download/v#{version}/BabyLock-#{version}.dmg"
  name "BabyLock"
  desc "Lock keyboard and mouse input - baby-proof your screen"
  homepage "https://github.com/PepijnSenders/baby-lock"

  depends_on macos: ">= :monterey"

  app "BabyLock.app"

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
