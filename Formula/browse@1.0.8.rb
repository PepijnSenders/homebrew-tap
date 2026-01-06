class Browse < Formula
  desc "Scrape any webpage to markdown using your browser session"
  homepage "https://github.com/PepijnSenders/browse-cli"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.8/browse-darwin-arm64.tar.gz"
      sha256 "393428f18e2d1ce053573784d764d38ab73c33f0ea2a9afa69097094a0456de2"
    end
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.8/browse-darwin-x64.tar.gz"
      sha256 "e5846a68924725d36535d0001fb50027e38e06c28a951637d33207d0f81436ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.8/browse-linux-x64.tar.gz"
      sha256 "e59172684bad1544766373e0cb8c8ee4a02b11e8a0dba0357bf9e0e4484e978d"
    end
  end

  def install
    # Handle both cases: tarball may extract with or without top-level dir
    if File.exist?("browse")
      bin.install "browse"
      pkgshare.install "extension"
      pkgshare.install "skills"
    else
      # Tarball extracts to browse-{platform}/
      platform_dir = Dir["browse-*"].first
      bin.install "#{platform_dir}/browse" => "browse"
      pkgshare.install "#{platform_dir}/extension"
      pkgshare.install "#{platform_dir}/skills"
    end
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
