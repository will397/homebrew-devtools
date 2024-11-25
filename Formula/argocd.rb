class Argocd < Formula
  desc "GitOps Continuous Delivery Tool for Kubernetes"
  homepage "https://argoproj.github.io/cd/"
  version "2.13.1"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/argoproj/argo-cd/releases/download/v#{version}/argocd-darwin-arm64"
    sha256 "9419f78550fbe2ecb02577fd3831c57e6d05a7c47a90e1e0f8262197fd10dcc9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/argoproj/argo-cd/releases/download/v#{version}/argocd-darwin-amd64"
    sha256 "6bfefaa9c66ea7b33e2777e3d57779e39ed91ec05a984dc94a09b94249a3f808"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/argoproj/argo-cd/releases/download/v#{version}/argocd-linux-amd64"
    sha256 "8e436f0429d2a88b3181d2cfc460c034070e0ee1c665467271e5d75eb4d55f7f"
  end

  def install
    bin.install "argocd-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "argocd"
  end

  test do
    assert_match "argocd: v#{version}", shell_output("#{bin}/argocd version")
  end
end
