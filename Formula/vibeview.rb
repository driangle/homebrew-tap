class Vibeview < Formula
  desc "A local viewer for Claude Code sessions"
  homepage "https://github.com/driangle/vibeview"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/vibeview/releases/download/v0.2.0/vibeview_0.2.0_darwin_arm64.tar.gz"
      sha256 "45be13c4bc4b9c37e4566c24931f2921e497411d5e582c902ec1d43100d3e0c9"
    end
    on_intel do
      url "https://github.com/driangle/vibeview/releases/download/v0.2.0/vibeview_0.2.0_darwin_amd64.tar.gz"
      sha256 "f920dd39bdecc78b68c3e7dc967b1ebf6ae6c730e57de49628540b1fb3516d88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/driangle/vibeview/releases/download/v0.2.0/vibeview_0.2.0_linux_amd64.tar.gz"
      sha256 "55c6e9f44b52df19ef3b18738a218d5823df45df2232715b973bbed868bdec94"
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
