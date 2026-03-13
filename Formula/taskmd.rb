class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.5/taskmd-v0.1.5-darwin-arm64.tar.gz"
      sha256 "c9c748944212021e4b0d6cfe3ba30d869f56a3018600a0798a93a319f1270518"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.5/taskmd-v0.1.5-darwin-amd64.tar.gz"
      sha256 "25f3394efb8f6429f9cd287fe8437162f14e12cc8848ae773ce3a21d7d443bbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.5/taskmd-v0.1.5-linux-arm64.tar.gz"
      sha256 "d1f991ad7b7f171d4940a09977576db2b0c11cdb81dc8e3119c7107a76b01431"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.5/taskmd-v0.1.5-linux-amd64.tar.gz"
      sha256 "a25e0d152892a7d86b8b1e3c4de4afe91c49f906846552a024e10222b03db5cf"
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
