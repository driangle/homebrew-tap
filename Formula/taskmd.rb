class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.1/taskmd-v0.2.1-darwin-arm64.tar.gz"
      sha256 "5025a84ced15f232bd6f44a4eb30c2cb9e86c39376b132d1a9c28e8f6925fed0"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.1/taskmd-v0.2.1-darwin-amd64.tar.gz"
      sha256 "b742ad90aad8a3c5ba058b9493d4eaabee36b54d45a70d19b4399d5cb703558d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.1/taskmd-v0.2.1-linux-arm64.tar.gz"
      sha256 "648a8d24a30808678ad438514f3b60b9a49772b625170c77c0ab5a8dd1378589"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.1/taskmd-v0.2.1-linux-amd64.tar.gz"
      sha256 "db903d5a871843ff6a19fc53eaa5a4721d28982bd0495a24fdc9eb1b9027cc06"
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
