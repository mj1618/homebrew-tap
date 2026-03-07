class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "f5253812651ab8020e58acc42272a96942f949cb5a42a899c17e0cbb905d43ad"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "6b9a51bc9e63ff72cf5427b16c7472e65c97e80cb3e7acfa99a102378407ca36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "14bf01e89552ccac922411ef623d7d0325accd3f22bac73e4af9bf51fc1da724"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "220b60d995a8075cd4c02d451c4c6582bd2a297a423dc4dcaf014d881e01965f"
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
