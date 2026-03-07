class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "6b5f75e63f7191b1385d5cea0810d3f1f32a83eb56b5b387c70793bed20ea286"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "d08a77483c3b0a0e4ff69ba6e6c020f7c13bf5f352619303ec1ee7f94246fff8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "da008eb4b474932bef131f1c8dc3559bf8e1bbef9306b36c5fa0a67cb6fa1982"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "64308812dc6951c87dc1ff8d6fab946f1caf64134f13d7d42630b6fcf10b56d5"
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
