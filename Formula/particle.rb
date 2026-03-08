class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "b42c26eac2e7a8521fef5f962a678548825d36727004b114c81d75e6a8ab2397"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "1addcfc2a38880d0e7f635a1b0b2791b9d12337dc768c0a1b8e0843c955de33d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "770f283b1c2f5c7f0976a129b46582a1c8889d232e2ccba678641a3ba06aa140"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "fdce75534c9e540cec71d2e7a3d2a2b2d1effba2d0a9bf1d5fb5e1ed75121d88"
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
