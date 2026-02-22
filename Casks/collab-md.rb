cask "collab-md" do
  version "0.1.0"

  on_arm do
    sha256 "4634adc42c16de611d5c21c7cd0a8f0a7fe9145b77955001669f83f9edd44a4a"
    url "https://github.com/PepijnSenders/collab.md/releases/download/v0.1.0/collab.md_0.1.0_aarch64.dmg"
  end

  on_intel do
    sha256 "91ed8465bac626663e567b5de7e8cd78d06912a1ae88f76c1233f5669ec17294"
    url "https://github.com/PepijnSenders/collab.md/releases/download/v0.1.0/collab.md_0.1.0_x64.dmg"
  end

  name "collab.md"
  desc "Native markdown editor and viewer"
  homepage "https://github.com/PepijnSenders/collab.md"

  depends_on macos: ">= :catalina"

  app "collab.md.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/collab.md.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/md.collab.desktop",
    "~/Library/Caches/md.collab.desktop",
    "~/Library/Preferences/md.collab.desktop.plist",
  ]
end
