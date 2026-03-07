class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "d9853aa5656e819abd0de0bb0e305a8803c6bbb1604e8da924cd3be56fa69556"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "b42fd20d67d2bef18e35a574fbbe10fb3bbf3708899b332a834cb4fc0e42027c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "96a6966e18188adb4dc5f6259ab5da532d108ca490f08261f182ab1d6e1b7d50"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "cdb9ee7b4463f9b8c35b3315f4dba362e4409b17729440cb544c5bcbde0389ca"
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
