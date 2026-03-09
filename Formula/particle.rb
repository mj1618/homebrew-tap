class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "ecde79bb5ea80e715468e9b7d959de797b54e84e06f1de98acc93cff020e44a1"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "b23e700355322cff86e5afb2c88b3655e288ed2114d669d02b8be44a8805d758"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "38da12a2ab41529f2a781d4bfd61cfdb3c148481bf885bb0876270cdae82630e"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "6db3650e96bff24dd820b7adb8c5ffa1b4460a1aa1dd5e4db51591b5a853b432"
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
