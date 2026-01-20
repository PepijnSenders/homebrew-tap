class SpaceRecorder < Formula
  desc "ASCII camera overlay for terminal streaming"
  homepage "https://github.com/PepijnSenders/space-recorder"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/space-recorder/releases/download/v0.1.0/space-recorder-x86_64-apple-darwin.tar.gz"
      sha256 "d4c99412dd23e1d3998a325b4a33cd8990a57f4856e542591db1eaf5dd6d8d06"
    end

    on_arm do
      url "https://github.com/PepijnSenders/space-recorder/releases/download/v0.1.0/space-recorder-aarch64-apple-darwin.tar.gz"
      sha256 "48d9ccd11511f8b87b6652357359c8d24470e8e106a5fb66335e673e25e41b0d"
    end
  end

  def install
    bin.install "space-recorder"
  end

  test do
    assert_match "space-recorder", shell_output("\#{bin}/space-recorder --version")
  end
end
