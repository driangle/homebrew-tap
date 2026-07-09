class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.6/taskmd-v0.2.6-darwin-arm64.tar.gz"
      sha256 "691922b272b646f5981f65fb321dab09503c7ca126052347d14a26bddbd73fb4"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.6/taskmd-v0.2.6-darwin-amd64.tar.gz"
      sha256 "9aae05bdd35367e90a4b76ce84f919da59b802f7f00f373ee82057ba735dd5d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.6/taskmd-v0.2.6-linux-arm64.tar.gz"
      sha256 "2ac6254b33140794f86039e489f2219a94826d8de8b263f3bea839d34abbeeff"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.6/taskmd-v0.2.6-linux-amd64.tar.gz"
      sha256 "df286d073cf1b48aed87d4fe7bcd0929119fb0312d3faf9806bfd301b80e8c16"
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
