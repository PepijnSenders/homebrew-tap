class Clisten < Formula
  desc "Terminal UI for NTS Radio"
  homepage "https://github.com/PepijnSenders/clisten"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.2/clisten-x86_64-apple-darwin.tar.gz"
      sha256 "2a1bbea23cca5953f4da596b070ab32a1ab4492f5eb121dceb5c3128d48631dc"
    end

    on_arm do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.2/clisten-aarch64-apple-darwin.tar.gz"
      sha256 "f62dd0f5494bd3f3b5abdcdce56c631282f820f002d6587cfb07f9f922a20387"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.2/clisten-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5975210f96cce608e817624e7b01294aaa216f7bc69cc088a551cdf920c9e12a"
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
