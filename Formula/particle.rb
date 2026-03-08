class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "3453ee3c1b2562b14e5fcf87b745a97c48b67214900abf322ad88e2c4a86071b"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "866341b2533a512c8ca53f4a4eb93458e991869e370a0d47ff5d63a2dffe0342"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "2435d6fbe2b6056d4cb1f2cdd0d71f4f8b3131538c38a60e6da7c058145f49e5"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "d0752456d7a7c67c7ed32fa196a0c2e44e9982be81edc2dced6767a9bbbcbea4"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "particle"
  end

  test do
    assert_match "particle", shell_output("#{bin}/particle --version")
  end
end
