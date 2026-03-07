class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "cf338af6180d08f64e7a3d3572db6455c80437cf9d11266276834dd657aa8a98"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "84b269911c06f512ad9262713c46488f28dabe37c6064c81b27ffa8261c9105d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "c166e39d7dd56d309552df96846114d5872ca727eee56c96f189d2c931e09689"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "73b6c5c2aa4c25c5ec3516e272b73b7dd68f1d45be278043fb5798eb6d4716c7"
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
