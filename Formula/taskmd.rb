class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.5/taskmd-v0.2.5-darwin-arm64.tar.gz"
      sha256 "e11e63e80e61f22679787d664985d8d51550b0b6f1e3e29faefac52c520d2e6a"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.5/taskmd-v0.2.5-darwin-amd64.tar.gz"
      sha256 "7e32c580ccb9c24e10d7f0e86bb0fd1e8c6e084aa4df57ddba3b7783b05d3d78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.5/taskmd-v0.2.5-linux-arm64.tar.gz"
      sha256 "013044976b81a5c734c76ff6fc1ba3618dbb6136c9ede89b1f978506bb43f88b"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.5/taskmd-v0.2.5-linux-amd64.tar.gz"
      sha256 "92fb9fdad864431a876fb235554e95d6ca12d5faf9fa812d7eefad229694337c"
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
