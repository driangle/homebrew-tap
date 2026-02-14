class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.5/taskmd-v0.0.5-darwin-arm64.tar.gz"
      sha256 "ecaa23bac0c6681099749c965e280d72084819dfeae1b0c0b460aa0fc5965650"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.5/taskmd-v0.0.5-darwin-amd64.tar.gz"
      sha256 "9c07ef66e661064261d7959767f38d0d1d5b8248984310456ac5b55f49b826f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.5/taskmd-v0.0.5-linux-arm64.tar.gz"
      sha256 "b244cc2b48c1e3edb28e9e292362df0638eec0d710a900df13099ef3a0436f0b"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.5/taskmd-v0.0.5-linux-amd64.tar.gz"
      sha256 "05ba17cfcc9317a96e94fb7f461eea39c28c54abe37d14abaa3bf45d7423038d"
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
