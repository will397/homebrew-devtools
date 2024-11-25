class AwsCli < Formula
  desc "Official Amazon AWS command-line interface"
  homepage "https://aws.amazon.com/cli/"
  version "2.15.0"  # Specify your desired version
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://awscli.amazonaws.com/AWSCLIV2-#{version}-darwin-arm64.zip"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://awscli.amazonaws.com/AWSCLIV2-#{version}-darwin-amd64.zip"
    sha256 "REPLACE_WITH_AMD64_SHA256"
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
