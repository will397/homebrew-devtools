class Kubectl < Formula
  desc "Kubernetes command-line interface"
  homepage "https://kubernetes.io/"
  version "1.29.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://dl.k8s.io/release/v#{version}/bin/darwin/arm64/kubectl"
    sha256 "9fa3fb048ba873166ad26dc6c78a805007241a227f135da817702e920b4c9811"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://dl.k8s.io/release/v#{version}/bin/darwin/amd64/kubectl"
    sha256 "e181209c43da4cd17eb9cde4b810a621d54164d6670628721ca2c0c9c1ad94cf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://dl.k8s.io/release/v#{version}/bin/linux/amd64/kubectl"
    sha256 "69ab3a931e826bf7ac14d38ba7ca637d66a6fcb1ca0e3333a2cafdf15482af9c"
  end

  def install
    bin.install "kubectl"
    chmod 0755, bin/"kubectl"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/kubectl version --client")
  end
end
