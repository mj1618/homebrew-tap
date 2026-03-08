class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "fd2e69cd2d9c8324725b7f5707b517924007a5deebdb56ecc4d40bc72514b06e"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "df6d5ee1e83f23f2e1de8c51a97c9433f1444b82106fefe064dd58b98373c6cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "a60692b173ba04f870bf2a171c2beb31da405fc29e45868347e59752cae69b04"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "c6b0737099de73588714b2cd384282f6a3e591dc34f2d2189413b9f950c682de"
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
