class Vibeview < Formula
  desc "A local viewer for Claude Code sessions"
  homepage "https://github.com/driangle/vibeview"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/vibeview/releases/download/v0.1.2/vibeview_0.1.2_darwin_arm64.tar.gz"
      sha256 "58f34b04bf670bccd0d88c0ae94b924a6f3d97635e66512d939b031ceadbdaa1"
    end
    on_intel do
      url "https://github.com/driangle/vibeview/releases/download/v0.1.2/vibeview_0.1.2_darwin_amd64.tar.gz"
      sha256 "fa2147aa2ee0d92d67c45d8b370daee20a5e966153a12fc12e9c72f5201d847d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/driangle/vibeview/releases/download/v0.1.2/vibeview_0.1.2_linux_amd64.tar.gz"
      sha256 "090f5c566d4ea2b912bb09e9448cdd08035dbd480b60be8388b4539bf7ce42d0"
    end
  end

  def install
    bin.install "vibeview"
  end

  test do
    system bin/"vibeview", "--version"
    assert_match version.to_s, shell_output("#{bin}/vibeview --version")
  end
end
