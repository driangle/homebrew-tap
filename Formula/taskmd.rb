class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.1/taskmd-v0.4.1-darwin-arm64.tar.gz"
      sha256 "b2825045c1b15ed5914aa65b55e499cafc971ce566cb98c9bfcf9575c3a200e2"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.1/taskmd-v0.4.1-darwin-amd64.tar.gz"
      sha256 "3a4ba666ff8cae48d0a09a8e7c25b9904648cfdc3fbd001779ed12105d39aeb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.1/taskmd-v0.4.1-linux-arm64.tar.gz"
      sha256 "67b0392203f2a479aa322b33578b482fee14dff6f31624c931ef69186100579b"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.4.1/taskmd-v0.4.1-linux-amd64.tar.gz"
      sha256 "d3dc48ab79ca875e4a457bbbe90142b620cbb183c289d0bf58ca154df13a2b31"
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
