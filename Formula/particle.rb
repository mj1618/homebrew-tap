class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "b114bd2ed9fdb1f4989419cd70a2f15ea9b29eb1290f8b5561fc41e6a1ac50b8"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "772014565271bfe5c448a0aa8fd1c6ede7120d015ab03628d3caa53ba77833ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "609f9d4bda2c503cbed91afbd43900efd71e6cad723b8cdf41a497a6aa147412"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "b64c62402426b6b8d42acfef30d3d1e0464e0d605d59caf318c399420305f600"
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
