cask "babylock" do
  version "1.0.0"
  sha256 "5d1565eca15402f7c9007aad22b70094722b58a10289557304b6e81d7e31e4c1"

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
