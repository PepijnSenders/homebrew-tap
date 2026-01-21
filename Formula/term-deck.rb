class TermDeck < Formula
  desc "Terminal presentation tool with cyberpunk aesthetic"
  homepage "https://github.com/PepijnSenders/term-deck"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PepijnSenders/term-deck/releases/download/v1.0.3/term-deck-darwin-arm64.tar.gz"
      sha256 "3ed98767064b01c7e79dba25f6f0cc6be66117c21ddc6c98c9cdd39e525fe424"
    else
      url "https://github.com/PepijnSenders/term-deck/releases/download/v1.0.3/term-deck-darwin-x64.tar.gz"
      sha256 "3541839fa9ac7f311ea7e19e55e83688e58bf972f1c65067d697ece0770c8376"
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
