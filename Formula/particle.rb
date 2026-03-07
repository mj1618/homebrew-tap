class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "a593face8e1e1efe0e012bb13949f2e39896a7f0438a9db984e07422f0d867a2"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "62ea940aac9b3a1d1caf09e88f8f01b07de4bfb491d55c87bcd4498bc96ba9b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "ca8083d916e3479e30c4869ab04919e3b1ecc2d642054c77885faf61fd92a082"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "e7245619da0ccca905373437bcaa5cbfef26b7367a8581dc625e517288472244"
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
