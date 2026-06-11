class Utlt < Formula
  desc "Installer and launcher for Arendi products"
  homepage "https://github.com/ArendiStudio/homebrew-apps"
  version "0.1.8"
  license :cannot_represent

  if OS.mac?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-apple-darwin/utlt-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "f696aad1dfa159e34b6c37ac7f8b450ec400c5f06d0d6d38f12aaa449e2f3a0f"

    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-unknown-linux-gnu/utlt-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "576dc579a10213ceb8cff335454db11a307a8e49c650ca97967d882a7d5924b7"
  else
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/x86_64-unknown-linux-gnu/utlt-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2e4589593702431150cafc315f16921a1ced9310e0ac00a4698aa8d969492d09"
  end

  def install
    bin.install "utlt"
  end

  test do
    assert_match "utlt", shell_output("#{bin}/utlt --help")
  end
end
