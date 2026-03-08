class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "d549d974f83b229f10e9c16e27943bffa5f88c4f620782c1bf5727ae86db7e81"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "7ca978d5c386197abc47bf40b03207face0ace548288609836a05d271bd34a04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "2a62a9f3cf511bba523a992119244a031245fb24961d2cfe5a408a67b3de244c"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "e950876396ca31e540e4ae20302580a5acedcb6ea06bd43984df05453bdecf17"
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
