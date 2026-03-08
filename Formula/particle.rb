class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "4d3572cf24ed14592938151123c1113e43b0eea58052839b7d36d7726a0c0d2c"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "333dd63f618c6823a01731a6f488d15346fb13542109ecae0e23d154d615b6ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "9f0fff58153184b427c2c954e34f25a25b18f68c43cfa9e9d007794da4ad3d12"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "4bb160e4c92037f062ca55a783733e04fd18c898fa84e02d109b5d9c3f3d2a02"
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
