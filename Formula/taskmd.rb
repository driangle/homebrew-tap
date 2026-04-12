class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.2/taskmd-v0.2.2-darwin-arm64.tar.gz"
      sha256 "e71f95556fcb649bd50f1026db388a1afb443ae75ce6b66802cdecfdbfd23d41"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.2/taskmd-v0.2.2-darwin-amd64.tar.gz"
      sha256 "8d3e491ff6a5528ff0b4067b79fa76cd52db9b63edee935c2034420cbfc8f2fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.2/taskmd-v0.2.2-linux-arm64.tar.gz"
      sha256 "ccaed1223bc440bff4471b9fe8f04b97c2b08a15b44120d8f54816df9b75d1b9"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.2/taskmd-v0.2.2-linux-amd64.tar.gz"
      sha256 "b51bdc435705df2572d718bf2e49fe423563ee85f02ce91de7c060c9a58a00a0"
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
