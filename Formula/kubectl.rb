class Kubectl < Formula
  desc "Kubernetes command-line interface"
  homepage "https://kubernetes.io/"
  version "1.13.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://dl.k8s.io/release/v#{version}/bin/darwin/arm64/kubectl"
    sha256 "ebd2aab3f186b3fcc8aa0c95536620cc4439ba0f43e0cbe69bd4e49c8074e5ec"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://dl.k8s.io/release/v#{version}/bin/darwin/amd64/kubectl"
    sha256 "2ff06345a02636f1e6934f19dbc55452b587e06b2828c775dcdb29229c8da40f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://dl.k8s.io/release/v#{version}/bin/linux/amd64/kubectl"
    sha256 "f3be209a48394e0e649b30ea376ce5093205fd6769c12e62c7ab39a0827c26fb"
  end

  def install
    bin.install "kubectl"
    chmod 0755, bin/"kubectl"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/kubectl version --client")
  end
end
