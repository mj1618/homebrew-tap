class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "f1541da158eedad4217bef8e70641ed984706bf07c6b058a6a09eeffbc2aed6d"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "184a3f357d3ba752f880cc425747368695157c1ed56f07158f9c1e64e8f2be39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "06e44f4235b9683a4f9a091af55cfd350839e5848fba765247c06661d22897b2"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "486cd017168d28c59997459161164a3a56a34a4117637c3659487304f3409548"
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
