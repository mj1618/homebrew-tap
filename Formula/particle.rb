class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "bac1454116264cd79c9d847bb7678e96ab79ab1eed4d0225bf09085b702298fa"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "7aa6f7e8b8a0c462593f557725a969a07706692cde578e9931a50c93244840f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "cf23d2b6647a10c543cb3ed9dcd7e82f1495ed268cf4f1fcb6940e6fb968c221"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "cd66ebab9b6e9eb1ba28931177976ab119521df5bfb446e5fffbce7e3ab9ec7d"
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
