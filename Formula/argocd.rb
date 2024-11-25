class Argocd < Formula
  desc "GitOps Continuous Delivery Tool for Kubernetes"
  homepage "https://argoproj.github.io/cd/"
  version "2.13.1"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argoproj/argo-cd/releases/download/v#{version}/argocd-darwin-arm64"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argoproj/argo-cd/releases/download/v#{version}/argocd-darwin-amd64"
    sha256 "REPLACE_WITH_AMD64_SHA256"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argoproj/argo-cd/releases/download/v#{version}/argocd-linux-amd64"
    sha256 "REPLACE_WITH_LINUX_SHA256"
  end

  def install
    bin.install "argocd-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "argocd"
  end

  test do
    assert_match "argocd: v#{version}", shell_output("#{bin}/argocd version")
  end
end
