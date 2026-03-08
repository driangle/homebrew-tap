class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.4/taskmd-v0.1.4-darwin-arm64.tar.gz"
      sha256 "453e190ec0bd29ff04b15d352747c21b28c2e8ef38844e4055ef35276c24fa58"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.4/taskmd-v0.1.4-darwin-amd64.tar.gz"
      sha256 "2866eec9f5a8f779dd42d9e4270a6b082c4ae407a92c66db1dec190e7d0f0f8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.4/taskmd-v0.1.4-linux-arm64.tar.gz"
      sha256 "097728f8d5f3cc47cd468131097741ad79780ee0c213149dd3c652374aeedc61"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.4/taskmd-v0.1.4-linux-amd64.tar.gz"
      sha256 "745c848bc71fcb7b30206f63e0e3528d9a4102cb66c6786a66b25f8e6fad88f9"
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
