class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.0/taskmd-v0.6.0-darwin-arm64.tar.gz"
      sha256 "38823caaf2948b2a8c32c980da92f7d6b1c38ac3fc060c6fe715071b19095172"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.0/taskmd-v0.6.0-darwin-amd64.tar.gz"
      sha256 "d3728aea638985ce5fb872f51f0ff1a7266238b5b57f2457ad4a8ddf6745f64f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.0/taskmd-v0.6.0-linux-arm64.tar.gz"
      sha256 "ead445c736a51758e5ff89e4768fac4832b66ddb2885f961b723d6c85367c275"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.0/taskmd-v0.6.0-linux-amd64.tar.gz"
      sha256 "e6c35403b1b11033cc000e6fe496bb857904fbd083307f00cf8bd4d9413a3643"
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
