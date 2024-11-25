class Kind < Formula
  desc "Kubernetes IN Docker - local clusters for testing Kubernetes"
  homepage "https://kind.sigs.k8s.io/"
  version "0.22.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kubernetes-sigs/kind/releases/download/v#{version}/kind-darwin-arm64"
    sha256 "a74b85f95204aa5c12f9b5a4392b50f2926fcfc6cc7be79a8fb07e81c1aaa3f4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kind/releases/download/v#{version}/kind-darwin-amd64"
    sha256 "510b49a3e1df2771ed37e7c343cf9c015ca4d4088f826ee7bf590b07b0380dfe"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/kind/releases/download/v#{version}/kind-linux-amd64"
    sha256 "654508d05aec00688a44e7e90b73fd3f91f84de30e4faf5f85acc565817a405e"
  end

  def install
    bin.install "kind-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "kind"
    chmod 0755, bin/"kind"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/kind version")
  end
end
