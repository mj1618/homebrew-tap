class Particle < Formula
  desc "CLI for RunParticle - instant cloud VMs from your terminal"
  homepage "https://runparticle.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mj1618/runparticle.com/releases/download/v0.1.0/particle-darwin-arm64", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "860b4ff93025cc18cfa234804760bf591513c620940b169a3e94820917d5e413"
    else
      url "https://github.com/mj1618/runparticle.com/releases/download/v0.1.0/particle-darwin-amd64", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "6327f05b0496ae62efc5a8a46bd8a1451a3b2b3671b9627f729dedfd685cf8be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mj1618/runparticle.com/releases/download/v0.1.0/particle-linux-arm64", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "d90c9d509117da13b51b9191fe69225375acf53648e0e2f3861e3d17b85fe916"
    else
      url "https://github.com/mj1618/runparticle.com/releases/download/v0.1.0/particle-linux-amd64", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "8289f3616a57dbada592053ef6e70a94d027acb08b797638928f51ff5aae439f"
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
