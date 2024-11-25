class Kustomize < Formula
  desc "Template-free customization of Kubernetes YAML manifests"
  homepage "https://kustomize.io/"
  version "5.5.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv#{version}/kustomize_v#{version}_darwin_arm64.tar.gz"
    sha256 "5baa407bdaee51b97626ef1fca3292e1a1c846357d3028db826057ecceed7178"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv#{version}/kustomize_v#{version}_darwin_amd64.tar.gz"
    sha256 "874224e75229821b1e571aefa45703789b77336302a34692eac65adbe0dc1cee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv#{version}/kustomize_v#{version}_linux_amd64.tar.gz"
    sha256 "6703a3a70a0c47cf0b37694030b54f1175a9dfeb17b3818b623ed58b9dbc2a77"
  end

  def install
    bin.install "kustomize"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/kustomize version")
  end
end
