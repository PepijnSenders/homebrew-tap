class Clisten < Formula
  desc "Terminal UI for NTS Radio"
  homepage "https://github.com/PepijnSenders/clisten"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.1/clisten-x86_64-apple-darwin.tar.gz"
      sha256 "dae6360288e09971defe2a5b825de0bc5881d4efe1756c00623e8e3c38a6d931"
    end

    on_arm do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.1/clisten-aarch64-apple-darwin.tar.gz"
      sha256 "951bb21f07237788e3109398eb97205e7d8dab47f5386e5373686f3c5f78b32f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.1/clisten-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c97927a81e1a4fad45375b10e2f53c9f4827d0c3613f1b3c48ba2edc43383a34"
    end
  end

  depends_on "mpv"

  def install
    bin.install "clisten"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clisten --version")
  end
end
