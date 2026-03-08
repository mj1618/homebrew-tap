class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "869f783b70a785edf429090414bb4b0cd0db4c3bcf16b26628363a95ce98bcb8"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "574b85676c6298a21cbf6be69a145deb20a7ff053de3580a87eae134f00f5fbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "e9aca4a873067fb6dcaa9d9647012c2dd904ad211dec11f1b411afc826f7930c"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "f248fc4e03c1af8616573169b3357b135935959e262e48dd6d8a59deb070c62c"
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
