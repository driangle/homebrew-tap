class Viewmd < Formula
  desc "Minimal file viewer for the browser — renders markdown, code, images, and directories"
  homepage "https://github.com/driangle/viewmd"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.3/viewmd-v0.2.3-darwin-arm64.tar.gz"
      sha256 "e3e41dbf9e3d64a32707509683bd917e76988ca833dab401f6ccf394a8472d5c"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.3/viewmd-v0.2.3-darwin-amd64.tar.gz"
      sha256 "b1a0b03cd82123693f8aa5700a486225e838a30221bd482680b166ed04629d72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.3/viewmd-v0.2.3-linux-arm64.tar.gz"
      sha256 "e019aa34bbb558b123695be9b9d054b7f5281692e9cda91df9bb22abb9ab9c19"
    end
    on_intel do
      url "https://github.com/driangle/viewmd/releases/download/v0.2.3/viewmd-v0.2.3-linux-amd64.tar.gz"
      sha256 "47811826930e1917411e9be7157b98f595e87c025640336094a916f7504c98bf"
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
