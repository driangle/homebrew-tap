class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.6/taskmd-v0.1.6-darwin-arm64.tar.gz"
      sha256 "8840e5c4d625d050c7db3309a4afea908b57bc3a28adb9f9005067163e649d22"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.6/taskmd-v0.1.6-darwin-amd64.tar.gz"
      sha256 "8a417f2bfc563841d478a59c0b8e9cb66fd08e278062b877d60be68a320ade27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.6/taskmd-v0.1.6-linux-arm64.tar.gz"
      sha256 "cc804994949771216001659dcfb83b04e03c6836209fc3f0baf5fdb930938741"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.6/taskmd-v0.1.6-linux-amd64.tar.gz"
      sha256 "72b5302866cbff58e51bcc9a5b02e1577adff1aa5adce47924ec0ddf3652fd2c"
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
