class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.4/taskmd-v0.2.4-darwin-arm64.tar.gz"
      sha256 "0340d083b479218853be348e523e83cd4d13f1c298a002283b4cabc0f3809722"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.4/taskmd-v0.2.4-darwin-amd64.tar.gz"
      sha256 "ec73e1742130b6d28e973c445e21a76202b40717c777287c3d85d0c77c9bcb25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.4/taskmd-v0.2.4-linux-arm64.tar.gz"
      sha256 "2762870fc1a03797a6be093c6ec5b32154ec705a3b7eec7b302f429c191d7c44"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.2.4/taskmd-v0.2.4-linux-amd64.tar.gz"
      sha256 "513e714ca3da349ad713214fb4cd65edec08645c6ce82bb28ed5919f3a9e1696"
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
