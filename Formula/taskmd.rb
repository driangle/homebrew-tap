class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-darwin-arm64.tar.gz"
      sha256 "56702cca5f21a6e1e877f42985afc4db34b56e542e629262b3d645abd1c3d7a9"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-darwin-amd64.tar.gz"
      sha256 "334d9951619b30c9773bcd7479efa3f2ec69f1b4f8767cae70845b90b3cd64a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-linux-arm64.tar.gz"
      sha256 "a0545e5d47fc1567d92d8da566fec89d3e386a55005462025f7f045b1015b616"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.0/taskmd-v0.2.0-linux-amd64.tar.gz"
      sha256 "4d153b79e968b11a0af8143c548e93772c3f2904165f790844b996e4a08e1e24"
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
