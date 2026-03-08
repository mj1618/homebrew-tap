class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "534b51c05dd8efe0a4e00fcf818fa5e28e36b2fac8f059973f041f9bff9632db"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "8ccafa7b41cb68ab23a832354016d14585e7f585624ef3183c2171c17d394475"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "baf06a2847df00545cd19ffe87d459e5445f367cc03e33e6e5ff8a74817dafe3"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "bb57458f89a9d0f3421e28322512c7aef7711b508d1eed2ef42a33d65cc8f06a"
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
