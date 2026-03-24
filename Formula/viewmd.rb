class Viewmd < Formula
  desc "Minimal file viewer for the browser — renders markdown, code, images, and directories"
  homepage "https://github.com/driangle/viewmd"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.2/viewmd-v0.2.2-darwin-arm64.tar.gz"
      sha256 "f6dc08fb8840f3088128f7cfc5bb8aa3ffaeb3190c3d86be315bfec4b9a8879c"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.2/viewmd-v0.2.2-darwin-amd64.tar.gz"
      sha256 "4acd8e56eed40410372efa707b134df4e9d9a1a65acbefbdff72c4d20996acd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.2/viewmd-v0.2.2-linux-arm64.tar.gz"
      sha256 "1a40c3ff73daebf60c36cde81c29c3616d5567c30a1b01bc83ab37092aff6279"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.2/viewmd-v0.2.2-linux-amd64.tar.gz"
      sha256 "486f4370ad555e96189b7bc11bd8a73bf3840fb7af8bc74f402c4f6f832e2c23"
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
