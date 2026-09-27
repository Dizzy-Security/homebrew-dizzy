class DizzyScan < Formula
  desc "DizzySecurity AI skill scanner CLI"
  homepage "https://github.com/Dizzy-Security/dizzy"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dizzy-Security/dizzy/releases/download/dizzy-scan/v0.2.0/dizzy-scan-darwin-arm64.tar.gz"
      sha256 "placeholder"
    else
      url "https://github.com/Dizzy-Security/dizzy/releases/download/dizzy-scan/v0.2.0/dizzy-scan-darwin-amd64.tar.gz"
      sha256 "placeholder"
    end
  end

  on_linux do
    url "https://github.com/Dizzy-Security/dizzy/releases/download/dizzy-scan/v0.2.0/dizzy-scan-linux-amd64.tar.gz"
    sha256 "placeholder"
  end

  def install
    if OS.mac?
      bin.install "dizzy-scan-darwin-arm64" => "dizzy-scan" if Hardware::CPU.arm?
      bin.install "dizzy-scan-darwin-amd64" => "dizzy-scan" if Hardware::CPU.intel?
    elsif OS.linux?
      bin.install "dizzy-scan-linux-amd64" => "dizzy-scan"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dizzy-scan --version")
  end
end
