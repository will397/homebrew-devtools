class Kind < Formula
  desc "Kubernetes IN Docker - local clusters for testing Kubernetes"
  homepage "https://kind.sigs.k8s.io/"
  version "0.25.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kubernetes-sigs/kind/releases/download/v#{version}/kind-darwin-arm64"
    sha256 "222701bb72ff596928c57b3c64ca3e0b969d593ef24ccc790f9c17904e7b63ea"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kind/releases/download/v#{version}/kind-darwin-amd64"
    sha256 "180404ae1c0de8d333583d2958cdfac5338ec3e32cd765a158cfd6d09eb8cd7d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kind/releases/download/v#{version}/kind-linux-amd64"
    sha256 "b22ff7e5c02b8011e82cc3223d069d178b9e1543f1deb21e936d11764780a3d8"
  end

  def install
    bin.install "kind-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "kind"
    chmod 0755, bin/"kind"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/kind version")
  end
end
