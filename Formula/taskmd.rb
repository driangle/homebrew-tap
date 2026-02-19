class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.10/taskmd-v0.0.10-darwin-arm64.tar.gz"
      sha256 "bb4f24784c8f5a25dd56f836da29ed69a12c523e0f4cc45d7bac2bdbbaefdffc"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.10/taskmd-v0.0.10-darwin-amd64.tar.gz"
      sha256 "170a007e32518d6d838b4179a583fcf14ac1fbec5adf73182b53b15062e673b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.10/taskmd-v0.0.10-linux-arm64.tar.gz"
      sha256 "d85e9fbbd0548544a7c09fc545aa600a5dc0c7675e57707c6db175c3548d0c42"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.10/taskmd-v0.0.10-linux-amd64.tar.gz"
      sha256 "5739955a9492778aa872a1ba05c894a94d76ccbb8dc2b4952825d4aa054db579"
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
