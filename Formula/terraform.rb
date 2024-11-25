class Terraform < Formula
  desc "Tool for building, changing, and versioning infrastructure"
  homepage "https://www.terraform.io/"
  version "1.5.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_darwin_arm64.zip"
    sha256 "db7c33eb1a446b73a443e2c55b532845f7b70cd56100bec4c96f15cfab5f50cb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_darwin_amd64.zip"
    sha256 "b310ec0e626e9799000cfc8e30247cd827cf7f8030c8e0400257c7f111e93537"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_linux_amd64.zip"
    sha256 "c0ed7bc32ee52ae255af9982c8c88a7a4c610485cf1d55feeb037eab75fa082c"
  end

  def install
    bin.install "terraform"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/terraform version")
  end
end
