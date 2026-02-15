class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.6/taskmd-v0.0.6-darwin-arm64.tar.gz"
      sha256 "6fe20c87a44ca248c27c415a1adf00a9adc563837428d0c6605b78138bb2a2ea"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.6/taskmd-v0.0.6-darwin-amd64.tar.gz"
      sha256 "197b72497c2a7a9dca18406c902a5d0ee7795283972ce5fae6cc220b433aef32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.6/taskmd-v0.0.6-linux-arm64.tar.gz"
      sha256 "8d519c3935926fae8f081128a7cb8f93c093aecbc4ff72a2fda02d98d4df7f04"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.6/taskmd-v0.0.6-linux-amd64.tar.gz"
      sha256 "e5124d424e60e7bc7f86391d8fabe2c6a8436a11d40608863087ddd2e5bcc5bb"
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
