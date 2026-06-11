class Utlt < Formula
  desc "Installer and launcher for Arendi products"
  homepage "https://github.com/ArendiStudio/homebrew-apps"
  version "0.1.7"
  license :cannot_represent

  if OS.mac?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-apple-darwin/utlt-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "c8f8766977b5d8726774a1be2b513820317193425075c009e61c546cb68c4a75"

    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-unknown-linux-gnu/utlt-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6b912c1f8418129ee55de0cdf0810965391e0c5f26f14034469ffe3d54b1af6b"
  else
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/x86_64-unknown-linux-gnu/utlt-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2ec68f530a0c08d03d3bbb353c734ed5984888aedeb7e7fce75386b0729988ac"
  end

  def install
    bin.install "utlt"
  end

  test do
    assert_match "utlt", shell_output("#{bin}/utlt --help")
  end
end
