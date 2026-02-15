class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-darwin-arm64.tar.gz"
      sha256 "8eaa433f87c7303a03e5ba8659d6b8fb827b0a2487cae9114d2b87490eaaa829"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-darwin-amd64.tar.gz"
      sha256 "4d818addb7800cf1b12bf93dedcdaacba42f926e70a73c73adecacfcece891a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-linux-arm64.tar.gz"
      sha256 "a1bc94c41d25c7f864be603686df2c9797b5b1849db0b5f6675454d80620ea23"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-linux-amd64.tar.gz"
      sha256 "09ca73454b5d1b0059fb79b7192d80f898a35cd142f60ce0507fe46601c9ef53"
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
