class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.3.0/taskmd-v0.3.0-darwin-arm64.tar.gz"
      sha256 "3db5cbc021ea78b4136892c0006d9666aa5e4d4ed6a5a954c8d78ca20d92bc4f"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.3.0/taskmd-v0.3.0-darwin-amd64.tar.gz"
      sha256 "f80018a0eabae037a914178a1a29b4664ac2dad87296b98471b4e9221f616ff6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.3.0/taskmd-v0.3.0-linux-arm64.tar.gz"
      sha256 "64ce7ca8d01619f57a5ecd8d4c37938825107cfd1a3f455d4ebc34f56a083b85"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.3.0/taskmd-v0.3.0-linux-amd64.tar.gz"
      sha256 "4978f63552b5d04ee2db3df9ffe671adc26da0d4a98dc285db286a0d15f922c6"
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
