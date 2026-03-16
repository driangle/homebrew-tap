class Viewmd < Formula
  desc "Minimal file viewer for the browser — renders markdown, code, images, and directories"
  homepage "https://github.com/driangle/viewmd"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.1/viewmd-v0.2.1-darwin-arm64.tar.gz"
      sha256 "9550b8e6e26da85207b22dbe0f8f483feba83755c2ff83710b0a5687482ee025"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.1/viewmd-v0.2.1-darwin-amd64.tar.gz"
      sha256 "1046bbfa3107048f3a26367c7a1efa7f2fe0be2138bc88140fb5594b2385d352"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.1/viewmd-v0.2.1-linux-arm64.tar.gz"
      sha256 "cef1b58bede93050c1d63e902f269c0cbed7faca9f2c6a84a6a318af6decd7a0"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.1/viewmd-v0.2.1-linux-amd64.tar.gz"
      sha256 "40bba6f9eacadaabc7e2203782746626be678272fbf2f949e9e03b44cfbd1ef8"
    end
  end

  def install
    bin.install "viewmd-darwin-arm64" => "viewmd" if OS.mac? && Hardware::CPU.arm?
    bin.install "viewmd-darwin-amd64" => "viewmd" if OS.mac? && Hardware::CPU.intel?
    bin.install "viewmd-linux-arm64" => "viewmd" if OS.linux? && Hardware::CPU.arm?
    bin.install "viewmd-linux-amd64" => "viewmd" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viewmd --version")
  end
end
