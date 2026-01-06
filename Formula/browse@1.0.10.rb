class Browse < Formula
  desc "Scrape any webpage to markdown using your browser session"
  homepage "https://github.com/PepijnSenders/browse-cli"
  version "1.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.10/browse-darwin-arm64.tar.gz"
      sha256 "6bef5876cb161b6529eb0d1f7c0175f97ea1efc0da4070204a200f3e141c7bb5"
    end
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.10/browse-darwin-x64.tar.gz"
      sha256 "8045a2238f0f59abf854bb7bb52bfa2b707384289591265745f8130c04ff98c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PepijnSenders/browse-cli/releases/download/v1.0.10/browse-linux-x64.tar.gz"
      sha256 "d066bf8faf5a4ae49ac6cf34e233dbb1d0e0a7281c6512208758cf0bc0188cd2"
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
