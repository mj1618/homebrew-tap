class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "0682da991f5872f6e7d3427f386ce817a066eadb454f6d8c564e30a37a6a0ed8"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "1857cb4cfc93fabc0552be0a8e9c6420a45046b4384d4ae93ef9c72255e7b0b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "57de9361d8b16cc22e79adbb674034ddde69013e7b8f2fed6062311ec607ed04"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "f67dff5cd00ffa5970567037b524fe47119e9336a5bdebe4fb3cd7f84bf09a4d"
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
