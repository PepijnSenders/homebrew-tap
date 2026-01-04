class Browse < Formula
  desc "Scrape any webpage to markdown using your browser session"
  homepage "https://github.com/PepijnSenders/browse-cli"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.6/browse-darwin-arm64.tar.gz"
      sha256 "bcb2b9590169219d88e8b605676c34fc6e59a8efbbe7052d718577bf2c7215be"
    end
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.6/browse-darwin-x64.tar.gz"
      sha256 "e825819e720e1b36faa56b0e908ec0d9a2c7522dcae7847d1f4320a49eb3b52e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.6/browse-linux-x64.tar.gz"
      sha256 "f1e947cbd5e6ebb207fb5fc1c066b68e0670d546a64ab38c77adf626f7f49a3d"
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
