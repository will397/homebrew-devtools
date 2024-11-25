class Bazelisk < Formula
  desc "User-friendly launcher for Bazel"
  homepage "https://github.com/bazelbuild/bazelisk"
  version "1.19.0"  # Specify your desired version

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bazelbuild/bazelisk/releases/download/v#{version}/bazelisk-darwin-arm64"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bazelbuild/bazelisk/releases/download/v#{version}/bazelisk-darwin-amd64"
    sha256 "REPLACE_WITH_AMD64_SHA256"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bazelbuild/bazelisk/releases/download/v#{version}/bazelisk-linux-amd64"
    sha256 "REPLACE_WITH_LINUX_SHA256"
  end

  def install
    bin.install "bazelisk-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "bazelisk"
    bin.install_symlink "bazelisk" => "bazel"
  end

  test do
    assert_match "Bazelisk version: #{version}", shell_output("#{bin}/bazelisk version")
  end
end
