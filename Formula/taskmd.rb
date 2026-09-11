class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.1/taskmd-v0.6.1-darwin-arm64.tar.gz"
      sha256 "8a18c87081f1768b7795d4a0d8dde40e1aa3bb74bd875a16200b1b1eb020bc2a"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.1/taskmd-v0.6.1-darwin-amd64.tar.gz"
      sha256 "e0350dcd6a393e97a9bc67d5c08bb62c5489fd3245cb801102e8c2234718a682"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.1/taskmd-v0.6.1-linux-arm64.tar.gz"
      sha256 "04c4541a22a07db8dc0901e97344a89b94245ba91e0ab5e645eda1a3b2eff081"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.6.1/taskmd-v0.6.1-linux-amd64.tar.gz"
      sha256 "69efdcbfee021fad56daa60cbed7b1eb66fc36830f3eb9ebe563026c459af082"
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
