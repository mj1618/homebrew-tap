class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "2c33d01e9112079c88a6cdd63b896ed37cbe965395f0968a6707cb8c751591ae"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "7473b6e1452ec225be68b510a7688f3a491fe391cb07d462d6ec20e666005a9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "b8c0ddf4e43f3a4318710b896e3ce6d4f32467d30f5c199c1b63bbc40f5fc19c"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "5148b7e10760acc3b23707e20605f3593c6084e3cfa51eff28fb288646407482"
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
