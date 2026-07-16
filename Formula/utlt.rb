class Utlt < Formula
  desc "Installer and launcher for Arendi products"
  homepage "https://github.com/ArendiStudio/homebrew-apps"
  version "0.1.9"
  license :cannot_represent

  if OS.mac?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-apple-darwin/utlt-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "58897746e9ea2199f89f85463d2373248be1bae265b58bc2b3e11f699131ea86"

    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-unknown-linux-gnu/utlt-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9b6cad7555de7aaf902b94b590318cfb4e81eb4ddf99dd5ab5c5140011f8b854"
  else
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/x86_64-unknown-linux-gnu/utlt-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e2f78bdf1281ad62599c800be4bc571ea3fc064816d2260349905decb13c723f"
  end

  def install
    bin.install "utlt"
    generate_completions_from_executable bin/"utlt", "completions"
  end

  test do
    assert_match "utlt", shell_output("#{bin}/utlt --help")
  end
end
