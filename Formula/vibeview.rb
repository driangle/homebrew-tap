class Vibeview < Formula
  desc "A local viewer for Claude Code sessions"
  homepage "https://github.com/driangle/vibeview"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/vibeview/releases/download/v0.1.1/vibeview_0.1.1_darwin_arm64.tar.gz"
      sha256 "2f3bd8e3c3fb923f637fe715c087ab61838ce331e17e0218256d219ef013e421"
    end
    on_intel do
      url "https://github.com/driangle/vibeview/releases/download/v0.1.1/vibeview_0.1.1_darwin_amd64.tar.gz"
      sha256 "fecb106e118c2f2f3c58c70fa4636579e0072b1d316314ce30ffdb4377caa34c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/driangle/vibeview/releases/download/v0.1.1/vibeview_0.1.1_linux_amd64.tar.gz"
      sha256 "db90702366cdc3fbfc9f0deaebb87e219476338646cb54b2f990d00d100ac0ba"
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
