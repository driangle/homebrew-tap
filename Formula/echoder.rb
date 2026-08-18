class Echoder < Formula
  desc "Headless renderer for Echoder creative-coding sketches"
  homepage "https://echoder.com/docs/guide/cli"
  version "0.2.0"
  license "MIT"

  depends_on "node"
  depends_on "ffmpeg" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/driangle/homebrew-tap/releases/download/cli-v0.2.0/echoder-0.2.0-darwin-arm64.tar.gz"
      sha256 "6ef20fc8383af4823535b93995f968acbae53f038c1a4be15fc5dbe65864b900"
    end
    on_intel do
      url "https://github.com/driangle/homebrew-tap/releases/download/cli-v0.2.0/echoder-0.2.0-darwin-x64.tar.gz"
      sha256 "dbe06afc223cc8dfcc371dc9e131ce81bf3c0b9733d3748efa843a4175ee1055"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/driangle/homebrew-tap/releases/download/cli-v0.2.0/echoder-0.2.0-linux-arm64.tar.gz"
      sha256 "8f86e48b79be869c8840d8de11a939a1b588b3effcd51bfee0e93921a5460b54"
    end
    on_intel do
      url "https://github.com/driangle/homebrew-tap/releases/download/cli-v0.2.0/echoder-0.2.0-linux-x64.tar.gz"
      sha256 "7393d6f936a12c36af8e8ee2abaf61f7565722809e6a665b65bdca2c5566b37a"
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
