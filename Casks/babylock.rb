cask "babylock" do
  version "1.1.0"
  sha256 "93092ba2c5a911687e124622af4133427212309c15806bd6fc78172d18c30535"

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
