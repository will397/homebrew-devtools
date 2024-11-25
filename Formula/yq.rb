class Yq < Formula
  desc "Process YAML documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  version "4.44.5"
 
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_arm64"
    sha256 "f7263c906b4ccb600089a4308abff209010cb51e17acac70a2f47454fdadb025"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_amd64"
    sha256 "0f7c2fc860b7551d2d961aac4b5d25db436f31cb7201c6be73d7ad0b052cc0ab" 
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_linux_amd64"
    sha256 "638c4b251c49201fc94b598834b715f8f1c6e9b1854d2820772d2c79f0289002"
  end
 
  def install
    bin.install "yq_#{OS.mac? ? 'darwin' : 'linux'}_#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "yq"
    chmod 0755, bin/"yq"
  end
 
  test do
    assert_match "v#{version}", shell_output("#{bin}/yq --version")
  end
end
