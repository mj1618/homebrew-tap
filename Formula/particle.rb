class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "9d6003a61f4326c49e8e8b59a6268eebd0cc87ada2a497c7420b4519f8b4bd07"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "eeefaf8cf059af20b9ee13c1fd02e30b00d6d0178849bfd124f09cf13ae6a5c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "ea5f58e095352bee85ca85f6e4a467793b09665146d1009e05eb67359cfa5c75"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "844f76fa7daf04091dc83454ffee89bca78e3f3cb4b1738602c74bad935db413"
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
