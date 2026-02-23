class Clisten < Formula
  desc "Terminal UI for NTS Radio"
  homepage "https://github.com/PepijnSenders/clisten"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.4.0/clisten-x86_64-apple-darwin.tar.gz"
      sha256 "80780c33d335b39bea25b4c72c1a1c4ae131df2c81c0c77f860d9e8b6b8bb9be"
    end

    on_arm do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.4.0/clisten-aarch64-apple-darwin.tar.gz"
      sha256 "1201aa5a3d5abbb76c4c4c02554f8d0acc4e439b1319d383e1ed063e4fb197d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.4.0/clisten-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69b466e6a29c6bec38d7dd37015d0ff0f31d94c3e425a03848c6ae925768dec6"
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
