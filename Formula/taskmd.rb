class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.2/taskmd-v0.1.2-darwin-arm64.tar.gz"
      sha256 "6ba6f6622af2096177da738da02077c7a241e19f4f2a6288e44d14d7b2886e76"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.2/taskmd-v0.1.2-darwin-amd64.tar.gz"
      sha256 "9882bf42a8cdf88e0d7061ee09321b27846ee6fd6f16ff7f8a884ce9fef43665"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.2/taskmd-v0.1.2-linux-arm64.tar.gz"
      sha256 "c3c6edef293d492758235ebde7592ac77d1604898141dbb7d801cd1f1b66254f"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.2/taskmd-v0.1.2-linux-amd64.tar.gz"
      sha256 "45e7fb49765bb0f05ad73c13e6777d2db22b2a0156b70312d14724c97459fffe"
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
