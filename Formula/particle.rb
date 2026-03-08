class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "0c58c1b6c20148c95169d9f88d0255af1c4d0e2768fc2dc8fb5a6909b24a56b6"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "45721883d47d57d7d90b571978c17bea0740708bb9de82846aaf754eabf3f15d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "20c5b2b67f21aed780aad305af8a553f4ccfc47ccae6e094708ad9a716d75f8b"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "3db72380c4a229be65788aefb800ffac848d019602e4de36d27b47eaa1324414"
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
