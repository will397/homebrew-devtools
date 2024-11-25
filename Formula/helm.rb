class Helm < Formula
  desc "Kubernetes package manager"
  homepage "https://helm.sh/"
  version "3.16.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://get.helm.sh/helm-v#{version}-darwin-arm64.tar.gz"
    sha256 "3a39f690173086e6eea17674751eb3c8b970c02697e49cecd4093eaa3cf89dcd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://get.helm.sh/helm-v#{version}-darwin-amd64.tar.gz"
    sha256 "495d75b404a96fb664f1ca3f8cb01db2210aacc62dbfa1bbab30916abbb20a57"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://get.helm.sh/helm-v#{version}-linux-amd64.tar.gz"
    sha256 "f5355c79190951eed23c5432a3b920e071f4c00a64f75e077de0dd4cb7b294ea"
  end

  def install
    system "tar", "xf", "helm-v#{version}-linux-amd64.tar.gz"
    bin.install Dir["linux-amd64/helm"].first
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/helm version")
  end
end
