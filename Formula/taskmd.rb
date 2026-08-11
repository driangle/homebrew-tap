class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.0/taskmd-v0.4.0-darwin-arm64.tar.gz"
      sha256 "c5cd784ca882d87a63b39275252756825a0da0d2be9c2ddf390914e3c2dd94ee"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.0/taskmd-v0.4.0-darwin-amd64.tar.gz"
      sha256 "a2fdc34a08d96ba5a0ba64724eb1d687754718a6e928c2a8349e8d372aa50551"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.0/taskmd-v0.4.0-linux-arm64.tar.gz"
      sha256 "943f9edbd5f64cd8e5d1cbad1a9a6287014fd1c44e48745a790065965fb9fc8e"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.0/taskmd-v0.4.0-linux-amd64.tar.gz"
      sha256 "e1ee91704f5190bd0b9cb82139f0dc0b9526268bf2fcf96a06322ed34614b57e"
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
