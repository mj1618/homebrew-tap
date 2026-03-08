class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "3840d678a96f4e02b180e47d31128261f68fb6c915bac8f11ae246e3fc36b17b"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "a17a185547539159c7a2f89557c2d7727e14048aa36595e0349a63ca5277f21b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "d5a7155df163ee7df45faeb13c3dd1b6fd537b9b63a1c9a3cf1f0ae711abbe3f"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "22b5065bf1760d85b2214ef7153f2e7450d72eddcb5a9823c55ceaa59f9bd55d"
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
