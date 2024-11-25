class Terraform < Formula
  desc "Tool for building, changing, and versioning infrastructure"
  homepage "https://www.terraform.io/"
  version "1.7.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_darwin_arm64.zip"
    sha256 "ce20fa40398014d14e3b459bf0e5cb8d12a04e920525ba2364344bcd41e8377c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_darwin_amd64.zip"
    sha256 "a97e36028aa4b936220c66568f3df040fb5fff636b7f464a721fe03594045b9b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_linux_amd64.zip"
    sha256 "4a127c243ba7f171bc1d24af5fd655d38e2da694334e4cf68943c4b2769dafc1"
  end

  def install
    bin.install "terraform"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/terraform version")
  end
end
