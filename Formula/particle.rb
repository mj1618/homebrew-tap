class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "62e8e055727b6373568a216017fa94bd0d4721bf766497f8b2d2c75f761464e3"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "8d7a0b9c65924a11db96fae0cb46c3f9d850efdf2ea797bb2cc6c6251a362e55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "93fdb1d777cfc3f716aca9e5369b6859d811d669c648527b04f140d9a5cef667"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "1e3f37503939fd9a54198982fda4596f7497e2411458bedccd6a47cff59c1709"
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
