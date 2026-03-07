class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-darwin-arm64"
      sha256 "7a9837032c89e57e3124987216979b0c285caf30df1dd27c07b6c500724c6bfe"
    else
      url "https://runparticle.com/releases/particle-darwin-amd64"
      sha256 "6d77a942f17dc00697853ffe809dae9461dbc46296d4e34dc040243e14e20b80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://runparticle.com/releases/particle-linux-arm64"
      sha256 "bc32c3b241b84a9b8a1478beb449be152c3aa040cdb111c6008d5b13b9c29ffa"
    else
      url "https://runparticle.com/releases/particle-linux-amd64"
      sha256 "889727f557e17bef69fea2c4e492fe69cb8e04f6bd7b8de6af833fc301a909fd"
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
