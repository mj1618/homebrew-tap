class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "0f8550ace0cd0cfbc7d5f8a1771b9fa27f980631abd45b3ba5f51cb08bcffd27"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "b80e5f0cefc7c780a35a5de4a5df54aaa5adc7104c38d5731937c5d74586fe0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "b5c7feb1b53d29ca357154564fbf22204f42d8695412cf1cc4ed0da3821d7527"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "341d9a147e818dd42efc9361713b3c5970a4b15648abe737bbf3b376f1216893"
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
