class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "7ef6b7c8686b9d6aafd4564c49084c9b0f695115fac2a468a7bb453944fd8609"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "ad365cf49d1720d88ca3a51b5698008d63bcfbdcbbe717880eda4694430e0e1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "efdbcea1b9659d82f15acdd6bda76d5810396807634472fa256ca9f1f1c599c8"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "75e672cf1da8d8d56b10e1beaa11fc8a755eb3ee328e4ecfcc86e74b7167238a"
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
