class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.3/taskmd-v0.1.3-darwin-arm64.tar.gz"
      sha256 "2b220c2e24514250119fe5572b24ba10aa654d0f7877e1aa9a32067fb28d5a8c"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.3/taskmd-v0.1.3-darwin-amd64.tar.gz"
      sha256 "681b12c60e358da8929484dd6bae994083ce924efcf47d23849c6b7327b326e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.3/taskmd-v0.1.3-linux-arm64.tar.gz"
      sha256 "9d1fb659da8532129b9f598871375b533601d2899d104a6ce3bae33c20dd11ce"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.3/taskmd-v0.1.3-linux-amd64.tar.gz"
      sha256 "85161a09d485934c36b1b3586a3dfbb5261bd4fe1f3481ec8ffccb25a103483f"
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
