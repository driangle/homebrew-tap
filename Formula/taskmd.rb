class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.0/taskmd-v0.5.0-darwin-arm64.tar.gz"
      sha256 "9194dc6de8aa358fbaa74656ce33975540b88faa60da604735d0126e83fad21b"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.0/taskmd-v0.5.0-darwin-amd64.tar.gz"
      sha256 "ce560ad78d5f52e51ed4d7ccacecc499a10834e9372c45398d70d0f612575d86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.0/taskmd-v0.5.0-linux-arm64.tar.gz"
      sha256 "dcc546cd9a87f0babd33178f5d7af8e567ccf57fd5b3923876b940396eb57dd0"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.0/taskmd-v0.5.0-linux-amd64.tar.gz"
      sha256 "b747f095ed5e27461ce1302787c53880ff9aac429cc0fe9e73619444975cca5f"
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
