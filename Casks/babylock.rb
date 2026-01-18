cask "babylock" do
  version "1.1.1"
  sha256 "4642a9ed01e9699212a66682f85c13f4534e7fcc6e933d8ee12ddda8e4279c7c"

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
