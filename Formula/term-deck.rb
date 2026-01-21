class TermDeck < Formula
  desc "Terminal presentation tool with cyberpunk aesthetic"
  homepage "https://github.com/PepijnSenders/term-deck"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PepijnSenders/term-deck/releases/download/v1.0.0/term-deck-darwin-arm64.tar.gz"
      sha256 "514f0293d500d76fe71f9d1c05b3298971029418306a6fa5b496d654c1a26452"
    else
      url "https://github.com/PepijnSenders/term-deck/releases/download/v1.0.0/term-deck-darwin-x64.tar.gz"
      sha256 "53d2e3a5377ff673a1466345c1090a880f1663cfed76d3b4433c8a6bb2d6f1b2"
    end
  end

  def install
    bin.install "term-deck-darwin-arm64" => "term-deck" if Hardware::CPU.arm?
    bin.install "term-deck-darwin-x64" => "term-deck" if Hardware::CPU.intel?
  end

  test do
    system "#{bin}/term-deck", "--version"
  end
end
