class Yq < Formula
  desc "Process YAML documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  version "4.41.1"
 
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_arm64"
    sha256 "b99c6db22b80b78bad5082ea45d6d3cce32fb29bd3aab48e25a9f503bb509a2c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_darwin_amd64"
    sha256 "ae2a3c7903b1db7462946f6b886f4a9043ab602e34d0ebddc7ec76c7a834c45f" 
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/mikefarah/yq/releases/download/v#{version}/yq_linux_amd64"
    sha256 "01cee42c7ba90a3a4d71e39ab6444fa7d8955e51c5480c3c0e3fd88e3f1c0bb5"
  end
 
  def install
    bin.install "yq_#{OS.mac? ? 'darwin' : 'linux'}_#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "yq"
    chmod 0755, bin/"yq"
  end
 
  test do
    assert_match "v#{version}", shell_output("#{bin}/yq --version")
  end
end
