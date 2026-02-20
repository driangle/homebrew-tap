class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.11/taskmd-v0.0.11-darwin-arm64.tar.gz"
      sha256 "42537a7f52686298dc0181eae3c1404e3dd10c0ed41ba73133ac6c99edd10dde"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.11/taskmd-v0.0.11-darwin-amd64.tar.gz"
      sha256 "fcaaf734cc382fdabacc2a0562c6c2dda1086d34b7c4d9f87af8b51ab5a0cef0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.11/taskmd-v0.0.11-linux-arm64.tar.gz"
      sha256 "0eb3affb21c665a8676d1f593d64b45e843b5c3f1c940c00bb79c5df4eaa6034"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.11/taskmd-v0.0.11-linux-amd64.tar.gz"
      sha256 "cb92e58a0642f52aa3939b2e34b70ee806b0e6992291e0e30be8c0bf87283d96"
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
