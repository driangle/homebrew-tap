class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-darwin-arm64.tar.gz"
      sha256 "ee0b401ecb2583d5d2c1cbabb510c4e3d8f1380d9eba2c4a7e5b8a81911053d3"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-darwin-amd64.tar.gz"
      sha256 "54142f0d03bc207e084f119ebbba88ad85603f968b6ea8662268e04119432a3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-linux-arm64.tar.gz"
      sha256 "0f70a1c8da01491d6b007a6d497830f0ea0e1c6fb6613bbec2a17c6d37b81c72"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-linux-amd64.tar.gz"
      sha256 "f0e0e516f424627e5d667705d4c473dd981f61e600419e8b9294fe26412cc79a"
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
