class Taskmd < Formula
  desc "Markdown-based task management CLI and web dashboard"
  homepage "https://github.com/driangle/taskmd"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.3/taskmd-v0.0.3-darwin-arm64.tar.gz"
      sha256 "fa6093a97275256c696fb93112d1c9c1e733984684cff628f688174a5424715e"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.3/taskmd-v0.0.3-darwin-amd64.tar.gz"
      sha256 "41128987261ccac46b602344972f76e659803d915d09d30c09c37fb22610edf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.3/taskmd-v0.0.3-linux-arm64.tar.gz"
      sha256 "ffd8ccbb5957ca0f91f1ca9b5a02d05ec982fd9e5626d5b3ab1ca8d7750f3e2f"
    end
    on_intel do
      url "https://github.com/driangle/taskmd/releases/download/v0.0.3/taskmd-v0.0.3-linux-amd64.tar.gz"
      sha256 "d3ea12d8d3a1e0c58eb91cdbe499259449b9f779cd700281ad5f9ec37e4d04d9"
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
