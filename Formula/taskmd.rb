class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.4/taskmd-v0.0.4-darwin-arm64.tar.gz"
      sha256 "42a6559f3a99a35e462e35c4aa8a8673bb268bb852ac86230cfa987c144bcdc5"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.4/taskmd-v0.0.4-darwin-amd64.tar.gz"
      sha256 "37bc27197c2e845c0b9f2aec57f104fdefc6dfcfe93c1d9ce562ca7581bb4e6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.4/taskmd-v0.0.4-linux-arm64.tar.gz"
      sha256 "0bc7cc62753a71e149afde946328eec27b30729eb404aff6f494dbb8de246220"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.4/taskmd-v0.0.4-linux-amd64.tar.gz"
      sha256 "54c3ebd52b17835ce0861ff1c4f561dfb0cb985d378111d2417b8e668ae386bc"
    end
  end

  def install
    bin.install "taskmd-darwin-arm64" => "taskmd" if OS.mac? && Hardware::CPU.arm?
    bin.install "taskmd-darwin-amd64" => "taskmd" if OS.mac? && Hardware::CPU.intel?
    bin.install "taskmd-linux-arm64" => "taskmd" if OS.linux? && Hardware::CPU.arm?
    bin.install "taskmd-linux-amd64" => "taskmd" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    system "#{bin}/taskmd", "--version"
    assert_match version.to_s, shell_output("#{bin}/taskmd --version")
  end
end
