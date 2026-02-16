class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.8/taskmd-v0.0.8-darwin-arm64.tar.gz"
      sha256 "b394fe9d8d4e3d4697f2676c4d4e190745ad4acbbaa030931aff584319f2a6f7"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.8/taskmd-v0.0.8-darwin-amd64.tar.gz"
      sha256 "6079c3be241dba1e9404fb45ecca6706f2d45f09eb4147b40a082cded42ef737"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.8/taskmd-v0.0.8-linux-arm64.tar.gz"
      sha256 "2b3cc8d12a401e66fdd2a152c198558f97c5a505b6031f0cdecdd1d2fdc33032"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.8/taskmd-v0.0.8-linux-amd64.tar.gz"
      sha256 "354c794c08a58bbaa31ed5e586880b20bc9361c464e7646a31285b53275e8c13"
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
