class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.2/taskmd-v0.6.2-darwin-arm64.tar.gz"
      sha256 "22fb915ebbc312be4ef319a51442bfbaccf6d8f6b2b3298c3cb225887430420f"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.2/taskmd-v0.6.2-darwin-amd64.tar.gz"
      sha256 "c8ab53101f6f6a448247e186bd7081abf46fc29e5d7dbc2e1dd6d8b240617152"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.2/taskmd-v0.6.2-linux-arm64.tar.gz"
      sha256 "327156c98e00b67002b7dcb28e8e9e50e586699ece2246ec71de9f2661de25bd"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.2/taskmd-v0.6.2-linux-amd64.tar.gz"
      sha256 "3637a671f543778206d132d3e7323c5ec9fafa8c9aba339f04fde3ba957b9ae3"
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
