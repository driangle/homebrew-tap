class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.2/taskmd-v0.0.2-darwin-arm64.tar.gz"
      sha256 "7789ca838a4ab9a6285a101b191a11913cb2f8f5ed7b042602a2347dd626c1bd"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.2/taskmd-v0.0.2-darwin-amd64.tar.gz"
      sha256 "8cacb049f901cb1e9280902dee8ef10e2aca1352ead8d6ba98b16bc0880b974a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.2/taskmd-v0.0.2-linux-arm64.tar.gz"
      sha256 "9189bfc148928a4c98f4d2a008841130387663b804b3420047399c488fc82279"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.2/taskmd-v0.0.2-linux-amd64.tar.gz"
      sha256 "294cd9ab534ee2cb382588ba04aca3d933404a4507ef11372d4fb9a36601cddf"
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
