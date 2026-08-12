class Echoder < Formula
  desc "Headless renderer for Echoder creative-coding sketches"
  homepage "https://github.com/driangle/echoder"
  version "0.1.0"
  license "MIT"

  depends_on "node"
  depends_on "ffmpeg" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/driangle/echoder/releases/download/cli-v0.1.0/echoder-0.1.0-darwin-arm64.tar.gz"
      sha256 "aa48a6522b82f470e34dc7cdf310c20d9fb64924a58356288d38c107c65ed50b"
    end
    on_intel do
      url "https://github.com/driangle/echoder/releases/download/cli-v0.1.0/echoder-0.1.0-darwin-x64.tar.gz"
      sha256 "a49bafaaf3dde6cccc4d7ee488efe0a17b4a9863cc95754af8027153b3b40af4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/echoder/releases/download/cli-v0.1.0/echoder-0.1.0-linux-arm64.tar.gz"
      sha256 "b1ebdf47e0e4fda62bd03ac41ee158570f7fe0cccd52978ee8f875a060be1dbf"
    end
    on_intel do
      url "https://github.com/driangle/echoder/releases/download/cli-v0.1.0/echoder-0.1.0-linux-x64.tar.gz"
      sha256 "c81705e1021fbc22015fec65d19eb2e297d8791e4831d03a2f14597bcc0fbc3f"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"lib/cli.mjs" => "echoder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/echoder --version")
    (testpath/"sketch.js").write("sketch.add(shape2d.circle({ x: 50, y: 50, radius: 20 }))")
    system bin/"echoder", "render", testpath/"sketch.js",
           "-o", testpath/"out", "--duration=1", "--fps=1", "--resolution=64x64"
    assert_path_exists testpath/"out"
  end
end
