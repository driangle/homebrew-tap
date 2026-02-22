class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.0/taskmd-v0.1.0-darwin-arm64.tar.gz"
      sha256 "ab3ece0a8c5dd6c52c0011bba76fd4259640404464f1017665b4bce73d4a19a3"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.0/taskmd-v0.1.0-darwin-amd64.tar.gz"
      sha256 "96c6b51021df89fd3a806263b84b4ef8ef16e0ac826628fc447c5098ce8a50d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.0/taskmd-v0.1.0-linux-arm64.tar.gz"
      sha256 "8245efb2d733b4613b56d1c67556176f3ffbfe051669d3a639ae43ee3bd4ae6c"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.1.0/taskmd-v0.1.0-linux-amd64.tar.gz"
      sha256 "471b62277720ef8d4eac78524e2189bab84f0cbe7aee3a9cabb5579d9d996d84"
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
