class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.1/taskmd-v0.1.1-darwin-arm64.tar.gz"
      sha256 "e0cc9b29b33fbc2cb9e224ae1b246bdb772773755e4caf30d4228ab14933347f"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.1/taskmd-v0.1.1-darwin-amd64.tar.gz"
      sha256 "6ab992f7171d9512b5af42d20ba35bdeef5424cd8e200b6e4e76ff0668f8c2b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.1/taskmd-v0.1.1-linux-arm64.tar.gz"
      sha256 "0bef618e0362bb92f1d5b210b31ccad0c5e474251b5ee95c850882609345d739"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.1/taskmd-v0.1.1-linux-amd64.tar.gz"
      sha256 "91ce42a90f3bf7e32eb9cf87777cf1b23fc0164d448f2d3cb24a0fc00ce1e7ba"
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
