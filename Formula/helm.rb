class Helm < Formula
  desc "Kubernetes package manager"
  homepage "https://helm.sh/"
  version "3.13.3"  # Specify your desired version

  if OS.mac? && Hardware::CPU.arm?
    url "https://get.helm.sh/helm-v#{version}-darwin-arm64.tar.gz"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://get.helm.sh/helm-v#{version}-darwin-amd64.tar.gz"
    sha256 "REPLACE_WITH_AMD64_SHA256"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://get.helm.sh/helm-v#{version}-linux-amd64.tar.gz"
    sha256 "REPLACE_WITH_LINUX_SHA256"
  end

  def install
    bin.install "darwin-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}/helm"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/helm version")
  end
end
