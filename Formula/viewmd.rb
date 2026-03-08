class Viewmd < Formula
  desc "Minimal file viewer for the browser — renders markdown, code, images, and directories"
  homepage "https://github.com/driangle/viewmd"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.0/viewmd-v0.2.0-darwin-arm64.tar.gz"
      sha256 "c89eeecfc14b552e832c1ac7debd002e61228165c538ca21064f373ea24fd5b5"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.0/viewmd-v0.2.0-darwin-amd64.tar.gz"
      sha256 "0c1a48792bd8596323fd8dd1129db78760bd6273ab0e267f269a8aab3846eb45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.0/viewmd-v0.2.0-linux-arm64.tar.gz"
      sha256 "9bbf5dc7f3298fd40bd7221174c9cde5f184f2faceb766f9f6ef661dcfa6458b"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.0/viewmd-v0.2.0-linux-amd64.tar.gz"
      sha256 "f7445ca7b0e6a4f58940559c0ccfc0bbe45579cc1ccc02c1e5cd1e6e5d69ce09"
    end
  end

  def install
    bin.install "viewmd-darwin-arm64" => "viewmd" if OS.mac? && Hardware::CPU.arm?
    bin.install "viewmd-darwin-amd64" => "viewmd" if OS.mac? && Hardware::CPU.intel?
    bin.install "viewmd-linux-arm64" => "viewmd" if OS.linux? && Hardware::CPU.arm?
    bin.install "viewmd-linux-amd64" => "viewmd" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viewmd --version")
  end
end
