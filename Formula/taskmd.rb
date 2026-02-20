class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.12/taskmd-v0.0.12-darwin-arm64.tar.gz"
      sha256 "6dd74a6a1ff2ac744d5654c6bbfed686427ea6023da3f282981ae10bcda00e2a"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.12/taskmd-v0.0.12-darwin-amd64.tar.gz"
      sha256 "978fc5570c9cc4bb14ed3022c4a9482a7a2126f7a1d55490460ea52873e926f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.12/taskmd-v0.0.12-linux-arm64.tar.gz"
      sha256 "acd7e92e3743c8648b7fda65800579cac9ac38b0b5656cd26658dbbeedd408bc"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.12/taskmd-v0.0.12-linux-amd64.tar.gz"
      sha256 "26401ee5481798dbb22cc9f3067023b586937db9fe3e69220f8daccdd6846709"
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
