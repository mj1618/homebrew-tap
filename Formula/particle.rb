class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "a2d9d002362bc9b7246701f8863f52037e2772d26ea8565659352a1b79dfbe36"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "3a3af18ba17867e81be956290d7eabcf210489d6c7f98f0f42e35b994810c546"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "b53338a9ded90c1779bdf5690d1b8148bed644bfe8e8240bf59e3affb71cc30a"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "4057a4d31b26eac7dc64484c5f168295e8f266746de4ebbf4873b1cbfe6e5ae1"
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
