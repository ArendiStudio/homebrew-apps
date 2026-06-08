class Utlt < Formula
  desc "Installer and launcher for Arendi products"
  homepage "https://github.com/ArendiStudio/homebrew-apps"
  version "0.1.5"
  license :cannot_represent

  if OS.mac?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-apple-darwin/utlt-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "4d7f291f36fb0bd4e600a0a51511ad7312c0de408575bf87a28d64e6e40d0d16"

    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-unknown-linux-gnu/utlt-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1d6a9a9e75791432e7ccbccc54b4e703b0cbba23e666bca2a1b352db29dcca49"
  else
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/x86_64-unknown-linux-gnu/utlt-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4921c0ad1ffb4d7cbe05f68639d46fee9874b7f73d44aa6a121dedf49eb6d129"
  end

  def install
    bin.install "utlt"
  end

  test do
    assert_match "utlt", shell_output("#{bin}/utlt --help")
  end
end
