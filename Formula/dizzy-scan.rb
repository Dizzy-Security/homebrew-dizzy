class DizzyScan < Formula
  desc "DizzySecurity AI skill scanner CLI"
  homepage "https://github.com/Dizzy-Security/dizzy"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dizzy-Security/dizzy/releases/download/dizzy-scan/v0.3.2/dizzy-scan-darwin-arm64.tar.gz"
      sha256 "160e79e05ec4dd9c8e3e5a6c92028db86a0baec81d17173289c863f696aa92df"
    else
      url "https://github.com/Dizzy-Security/dizzy/releases/download/dizzy-scan/v0.3.2/dizzy-scan-darwin-amd64.tar.gz"
      sha256 "7ff8e94f40dc3cb537149637edb656df50443bf136fecb0dd4bc94452f5dbe1c"
    end
  end

  on_linux do
    url "https://github.com/Dizzy-Security/dizzy/releases/download/dizzy-scan/v0.3.2/dizzy-scan-linux-amd64.tar.gz"
    sha256 "c360571dd20df209604d00b959a90a2e83e2921ba13752f2cc3f1ee2e129bc14"
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
