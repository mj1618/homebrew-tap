class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "15cb88beee7cc29c390e4c185025be4aea0c5494a50f22f93f2b47a2ee364d85"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "9f4cd4ee44b90ad7a0bcefa51fb99aa2f43d87caceeaa0161049eb4893dfc07f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "98819e0897eb1eb4ff87887ef490d3ae633cf5f4bbd0bd35b4c041a1633025a3"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "3bb710dba07d08bfe2d592895edec6f521e8f644fea041512967e08b54e905ab"
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
