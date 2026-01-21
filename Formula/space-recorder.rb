class SpaceRecorder < Formula
  desc "ASCII camera overlay for terminal streaming"
  homepage "https://github.com/PepijnSenders/space-recorder"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/space-recorder/releases/download/v0.1.2/space-recorder-x86_64-apple-darwin.tar.gz"
      sha256 "751b043683a29b29f68f52e41d4d56925d0b3eb9fa9648e4b5e3c0e263f4bc70"
    end

    on_arm do
      url "https://github.com/PepijnSenders/space-recorder/releases/download/v0.1.2/space-recorder-aarch64-apple-darwin.tar.gz"
      sha256 "6795dc335ae35cc1fdb5bc0cc69a9a3ffde26a2862c8202ac80099d5c12a1640"
    end
  end

  def install
    bin.install "space-recorder"
  end

  test do
    assert_match "space-recorder", shell_output("\#{bin}/space-recorder --version")
  end
end
