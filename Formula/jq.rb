class Jq < Formula
  desc "Lightweight and flexible command-line JSON processor"
  homepage "https://stedolan.github.io/jq/"
  version "1.7.1"  # Specify your desired version

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-macos-arm64"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-macos-amd64"
    sha256 "REPLACE_WITH_AMD64_SHA256"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-linux64"
    sha256 "REPLACE_WITH_LINUX_SHA256"
  end

  def install
    bin.install "jq-#{OS.mac? ? 'macos' : 'linux64'}" => "jq"
    chmod 0755, bin/"jq"
  end

  test do
    assert_match "jq-#{version}", shell_output("#{bin}/jq --version")
  end
end
