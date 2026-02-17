class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.9/taskmd-v0.0.9-darwin-arm64.tar.gz"
      sha256 "76f7df9909f84cb29765e9eaf27bf5249485c59c7c105632aed66bd93a630e7c"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.9/taskmd-v0.0.9-darwin-amd64.tar.gz"
      sha256 "842ac762e297426f976c61c6f176a895c4c62009a1b8aeb4b3beef529e8039ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.9/taskmd-v0.0.9-linux-arm64.tar.gz"
      sha256 "9fe9186432d1a3a84c987685bd448b2d0b5b04fa803f817e16de2b6224dd39f8"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.9/taskmd-v0.0.9-linux-amd64.tar.gz"
      sha256 "082bb313591d4482c267ef6f563cebe623c0ccd8730b7744efdb9a39fac51c94"
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
