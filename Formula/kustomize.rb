class Kustomize < Formula
  desc "Template-free customization of Kubernetes YAML manifests"
  homepage "https://kustomize.io/"
  version "5.3.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv#{version}/kustomize_v#{version}_darwin_arm64.tar.gz"
    sha256 "585447f9ca3d77f0e0a04bca1c06a932d43a2935ba85efc68a9c53c50f4f8da9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv#{version}/kustomize_v#{version}_darwin_amd64.tar.gz"
    sha256 "fd0c3d37b956d71df4fd4e3bef973ce5fc6df8b8fcd36cb2ce8e33d562c66a6b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv#{version}/kustomize_v#{version}_linux_amd64.tar.gz"
    sha256 "d96769db01722ffa598ed784d0379ec3edeb2f9c39bc288026ac578fd8fd3787"
  end

  def install
    bin.install "kustomize"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/kustomize version")
  end
end
