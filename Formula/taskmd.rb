class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.7.0/taskmd-v0.7.0-darwin-arm64.tar.gz"
      sha256 "6ebc9b18d8162b4be06970905776e89e2ccabd10f439822f52d274f34a2525fa"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.7.0/taskmd-v0.7.0-darwin-amd64.tar.gz"
      sha256 "e6f7c132fa8948046f9aaaf22bf401960d5f696a11dadad74d38b1a2e03ed0bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.7.0/taskmd-v0.7.0-linux-arm64.tar.gz"
      sha256 "7aaf3be863a67fafb520714ddf0b4888758f700ee35583679f047349a494337d"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.7.0/taskmd-v0.7.0-linux-amd64.tar.gz"
      sha256 "876762fe4961ae4bfa062c4febf7e0581281924b193bd781a533543aa64e141f"
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
