class Utlt < Formula
  desc "Installer and launcher for Arendi products"
  homepage "https://github.com/ArendiStudio/homebrew-apps"
  version "0.1.6"
  license :cannot_represent

  if OS.mac?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-apple-darwin/utlt-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "629e25710c244986ae045a3f8280b067d3706b5a09cea1dee4a9275a67555a6e"

    depends_on arch: :arm64
  elsif Hardware::CPU.arm?
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/aarch64-unknown-linux-gnu/utlt-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0642b5f94a0877fade5b834981ddb0024e29416e94b94d51c24ca3c92b691a5e"
  else
    url "https://raw.githubusercontent.com/ArendiStudio/homebrew-apps/main/artifacts/utlt/#{version}/x86_64-unknown-linux-gnu/utlt-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eda46a643eb6ac232d45f44fbc015d949c9a821c7d30c259c681e24fe6498af1"
  end

  def install
    bin.install "utlt"
  end

  test do
    assert_match "utlt", shell_output("#{bin}/utlt --help")
  end
end
