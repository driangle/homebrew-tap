class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.1/taskmd-v0.5.1-darwin-arm64.tar.gz"
      sha256 "a4fcdcda14ab63bd373b88786ceb872fb66d8bed4e01444d7459870d77aba1ce"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.1/taskmd-v0.5.1-darwin-amd64.tar.gz"
      sha256 "f5f8ecba78b42c5b0ec9c9e67a58879c2c5b69848a0718fd5e600c3a006f2146"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.1/taskmd-v0.5.1-linux-arm64.tar.gz"
      sha256 "d3effaa19d650f4934758863a622b80446f071bdcc609903f38c4ea61df5aa69"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.5.1/taskmd-v0.5.1-linux-amd64.tar.gz"
      sha256 "d821be6170a9f6199ba746aa92880d493ed00cc035cc7cb64cb95769cb59b517"
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
