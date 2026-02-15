class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-darwin-arm64.tar.gz"
      sha256 "29d29388d20522bce4530b4de5dacff719e573536d292d2423ef6d7677a7cc32"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-darwin-amd64.tar.gz"
      sha256 "7ce976d58d311eef3dea9b75a6937f2317b8939bb37d91163d018050ee39ef07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-linux-arm64.tar.gz"
      sha256 "7c51eb3a094d32aaf9de585e6e83d260248d556e6ae76f3f0466a7a8efbeae4e"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.7/taskmd-v0.0.7-linux-amd64.tar.gz"
      sha256 "28db344bfeeacc4b30468f455b09301999e65f3c67c8d232c2760fee88af5ddc"
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
