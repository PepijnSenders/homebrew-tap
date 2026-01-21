class SpaceRecorder < Formula
  desc "ASCII camera overlay for terminal streaming"
  homepage "https://github.com/PepijnSenders/space-recorder"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/space-recorder/releases/download/v0.1.1/space-recorder-x86_64-apple-darwin.tar.gz"
      sha256 "8b5c551ebb99348505481a34b51f93ad15d98cf53fba565d30ba81463a4bf179"
    end

    on_arm do
      url "https://github.com/PepijnSenders/space-recorder/releases/download/v0.1.1/space-recorder-aarch64-apple-darwin.tar.gz"
      sha256 "2fccbca102d06b2df4c0185d9736ba58cae795e6e2e565b7d3d903378208ea30"
    end
  end

  def install
    bin.install "space-recorder"
  end

  test do
    assert_match "space-recorder", shell_output("\#{bin}/space-recorder --version")
  end
end
