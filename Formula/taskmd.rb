class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.8.0/taskmd-v0.8.0-darwin-arm64.tar.gz"
      sha256 "a05c91db6861b55afd4931c482423acef92ade44a233b908be918f77edd68191"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.8.0/taskmd-v0.8.0-darwin-amd64.tar.gz"
      sha256 "0b59f2701c5cf98490c42cdf2ef6b7e0fc5904fc44c8ea1098ff05ea19419fa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.8.0/taskmd-v0.8.0-linux-arm64.tar.gz"
      sha256 "7df47d6edc6f3ea06c39e10d46ef25a4b4544d9b9bec75b8a7fa6170440a3edb"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.8.0/taskmd-v0.8.0-linux-amd64.tar.gz"
      sha256 "d3a557277390acbbdd47fa3f0c5e3dbbc045058756395957fe156223f64c79ff"
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
