cask "babylock" do
  version "1.0.1"
  sha256 "2ed4da897d02fafcccff4f36925bcd666a23e5c3dde0c0ffe4675a28c58cd237"

  url "https://github.com/PepijnSenders/baby-lock/releases/download/v#{version}/BabyLock-#{version}.dmg"
  name "BabyLock"
  desc "Lock keyboard and mouse input - baby-proof your screen"
  homepage "https://github.com/PepijnSenders/baby-lock"

  depends_on macos: ">= :monterey"

  app "BabyLock.app"

  zap trash: [
    "~/Library/Preferences/com.babylock.app.plist",
  ]
end
