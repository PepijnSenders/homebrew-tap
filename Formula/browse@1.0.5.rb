class Browse < Formula
  desc "Scrape any webpage to markdown using your browser session"
  homepage "https://github.com/PepijnSenders/browse-cli"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.5/browse-darwin-arm64.tar.gz"
      sha256 "91560292b29b13046f5e3ffc484386e607e7a4b160e1893e0e0c60c2716d8b7e"
    end
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.5/browse-darwin-x64.tar.gz"
      sha256 "cc5fcb3192a140d4f7f9fa18342cef3fb1d48e4b7f8ec82f7e5995d9db2baf42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.5/browse-linux-x64.tar.gz"
      sha256 "ab797067895ea15265a539d84e1de4ac0fd95aa4bfbee53865de2538cecfc10e"
    end
  end

  def install
    # The tarball extracts to browse-{platform}/
    bin.install Dir["browse-*/browse"].first => "browse"
    pkgshare.install Dir["browse-*/extension"].first => "extension"
    pkgshare.install Dir["browse-*/skills"].first => "skills"
  end

  def caveats
    <<~EOS
      To use browse, install the Chrome extension:

      1. Open chrome://extensions in Chrome
      2. Enable "Developer mode" (top right)
      3. Click "Load unpacked"
      4. Select: #{pkgshare}/extension

      Then start the daemon:
        browse init

      And scrape any page:
        browse https://example.com
    EOS
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --help")
    assert_match version.to_s, shell_output("#{bin}/browse --version")
  end
end
