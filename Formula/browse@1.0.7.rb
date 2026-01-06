class Browse < Formula
  desc "Scrape any webpage to markdown using your browser session"
  homepage "https://github.com/PepijnSenders/browse-cli"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.7/browse-darwin-arm64.tar.gz"
      sha256 "5c58cb68953dafbec51824fbb97c9d2f53188f049cae5b7d3dfceb7742c54ffd"
    end
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.7/browse-darwin-x64.tar.gz"
      sha256 "9f6b6031c6ac908501d7b8516e36c94ca6622d6ea078b2306a3c2dfe1775cf29"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.7/browse-linux-x64.tar.gz"
      sha256 "5cf977ebb491de154716467978223ce63595be9b84c75d5afb1d51d1bf9008d0"
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
