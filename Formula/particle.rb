class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "acf235da9d456c50985c716d4bff9ee4d53b289a1885aa9c1209e093c5a69fc0"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "b2fc63be37b4b89e41375557c20b46c3280e0693f7fa90e4aec590f491f2b672"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "0783cbaa838718582f9e767339e4f12048298a312772693a985a53115e6625fd"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "0b2f0262d3870f27af01658eec4a060f21e32e2f62f32f59bf422b32931071f3"
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
