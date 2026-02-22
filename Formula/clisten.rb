class Clisten < Formula
  desc "Terminal UI for NTS Radio"
  homepage "https://github.com/PepijnSenders/clisten"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.0/clisten-x86_64-apple-darwin.tar.gz"
      sha256 "8a32acbe2931847c27a30aac4779daa00ec40efef31b0809960e3ef47bf53a80"
    end

    on_arm do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.0/clisten-aarch64-apple-darwin.tar.gz"
      sha256 "f5b812ac6cb0ac44b7bf6e490ff0f83e079af4837d436952f1f93ee0d2d9422a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.3.0/clisten-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e68ad30b59bfb4676500eb41e840c9bdbb2bd722f8fa1b4732089dbd730e1c1"
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
