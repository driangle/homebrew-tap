class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.3/taskmd-v0.2.3-darwin-arm64.tar.gz"
      sha256 "22b6f5048dd430f374322844de050370caefcc4c324fe79b7fe15f3465b5e528"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.3/taskmd-v0.2.3-darwin-amd64.tar.gz"
      sha256 "9706cc9c93d5ee48335e64aabd093976b7338b55d7726c93db97d0ac0ca500b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.3/taskmd-v0.2.3-linux-arm64.tar.gz"
      sha256 "61bcad081a8b10e5f7ae5b7303da76ed8329361bee5770b9c96343b039e672f0"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.3/taskmd-v0.2.3-linux-amd64.tar.gz"
      sha256 "007520173e1f2cb4127b56d5057b27ec77f55c7aaeba5f8a1c046be2c9cd9599"
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
