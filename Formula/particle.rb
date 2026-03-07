class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "fabc667adcba3322143d3226a815b8b8ee961e445e2640279608bfd9cb290215"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "bcd52a73b026608f959678d94dc15a53a64edf238845ca5b1b0be8fd803e8ad7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "b7887bd955a4f1d187afe74db83daa7bcfc2f7e48d588fc893cf06a7e8ff12f8"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "e83bb376ff3f54b74987f9432d38f0701a0fdcea6ee05918f565750cface239a"
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
