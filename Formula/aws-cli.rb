class AwsCli < Formula
  desc "Official Amazon AWS command-line interface"
  homepage "https://aws.amazon.com/cli/"
  version "2.22.4"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://awscli.amazonaws.com/AWSCLIV2-#{version}-darwin-arm64.zip"
    sha256 "ba020997822c9d929d1e0511d7655808c31df8f60498b14b6a49387b9d6edc7a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://awscli.amazonaws.com/AWSCLIV2-#{version}-darwin-amd64.zip"
    sha256 "ba020997822c9d929d1e0511d7655808c31df8f60498b14b6a49387b9d6edc7a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-#{version}.zip"
    sha256 "REPLACE_WITH_LINUX_SHA256"
  end

  def install
    system "./install", "--bin-dir", bin, "--install-dir", libexec
    bin.install_symlink libexec/"aws"
  end

  test do
    assert_match "aws-cli/#{version}", shell_output("#{bin}/aws --version")
  end
end
