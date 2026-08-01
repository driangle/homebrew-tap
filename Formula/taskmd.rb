class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.7/taskmd-v0.2.7-darwin-arm64.tar.gz"
      sha256 "392937835e5dfdfb3d1784e66bfacb43c4abbaa8147c012f295e158abac26323"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.7/taskmd-v0.2.7-darwin-amd64.tar.gz"
      sha256 "c40563307b9bcaeb595989fb7c635dfad36159fd17046cec67b171d99de6f454"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.7/taskmd-v0.2.7-linux-arm64.tar.gz"
      sha256 "84f180470993caff29c8bd86d40afdd63bab1c425a82456005155559b072c48b"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.7/taskmd-v0.2.7-linux-amd64.tar.gz"
      sha256 "3d259edbf9289d3eb36875487b14d79e891b695ede5e837232291ed1448617cd"
    end
  end

  def install
    bin.install "taskmd-darwin-arm64" => "taskmd" if OS.mac? && Hardware::CPU.arm?
    bin.install "taskmd-darwin-amd64" => "taskmd" if OS.mac? && Hardware::CPU.intel?
    bin.install "taskmd-linux-arm64" => "taskmd" if OS.linux? && Hardware::CPU.arm?
    bin.install "taskmd-linux-amd64" => "taskmd" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    system bin/"taskmd", "--version"
    assert_match version.to_s, shell_output("#{bin}/taskmd --version")
  end
end
