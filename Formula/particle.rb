class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "cd075beade77a301c5396f9ead2717dd6e2b84c5d1975e013fbd4b302d7ff672"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "c7d4e4e2fe212e66dd2cdc710a8951c6f06a3c960c6428c741715e45b2e994aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "9fc79da5780e2f4fdeab493cac5bc1e8617aea64341058460444d41f29a0a5ea"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "4ec20fb4b145372045212da56e26786345b9948cc9014e6886ba3289c8116ea7"
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
