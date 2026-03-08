class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "e8986dc9aa5480038f80981e0a40a0d53e97551d2b7dbb76a606f16e9a100da6"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "0cdb15a86322211937ce486da8dca8d458c36880c83bbd98d243598e7a4c58b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "e29411b865745fa819b84fde80ba48c549ae3fcb0ccdd0bedd09d8c65cad6faa"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "cb03e729ecb311c62d651a5ba2c17951c45458cc0e8ae6249c97730f1fa16f7a"
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
