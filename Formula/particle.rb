class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "7c39f59a1394af042811936c8c11681c768c66e096f29450795cc9f1f75633c0"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "a68f935d9e76a26db4fcf24d02b113a37b82f552af5ea586744f5f2cbd4b079a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "d85ffe8277db7835f37c9bafd8529573408664ac3f26140d9fc1816528a19ff4"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "f6637bbfbff83ee7e420ae714fae675ef9bb5069ead28e71c97bb9faffbda23e"
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
