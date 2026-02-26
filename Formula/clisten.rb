class Clisten < Formula
  desc "Terminal UI for NTS Radio"
  homepage "https://github.com/PepijnSenders/clisten"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.4.1/clisten-x86_64-apple-darwin.tar.gz"
      sha256 "1793ae225ecf651456be4c777918b82ee3dd251d31b6d27e2d97913a04c00a16"
    end

    on_arm do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.4.1/clisten-aarch64-apple-darwin.tar.gz"
      sha256 "a00636b7e37ec8ac70f4b9a6779254d68fdac498f176042fd14ee176cc3f644a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/clisten/releases/download/v0.4.1/clisten-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5011f54f60d8fbfe7e98f629ac1ba16cce7f1ee61a979e38a17a1b38c3b4dc39"
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
