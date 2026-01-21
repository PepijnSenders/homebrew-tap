class TermDeck < Formula
  desc "Terminal presentation tool with cyberpunk aesthetic"
  homepage "https://github.com/PepijnSenders/term-deck"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PepijnSenders/term-deck/releases/download/v1.0.1/term-deck-darwin-arm64.tar.gz"
      sha256 "fccb5faf4059111806bead7a70bfaac5d369b0705540d5b7d512c28116b3de8b"
    else
      url "https://github.com/PepijnSenders/term-deck/releases/download/v1.0.1/term-deck-darwin-x64.tar.gz"
      sha256 "a98df94739b54b49f7aa0d51b40a080e21c6f7841b2bfbb7ef80f2956ad5c3db"
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
