class Bazelisk < Formula
  desc "User-friendly launcher for Bazel"
  homepage "https://github.com/bazelbuild/bazelisk"
  version "1.24.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bazelbuild/bazelisk/releases/download/v#{version}/bazelisk-darwin-arm64"
    sha256 "8e13a5ca47fcdb34c283dcc9e301a4cb47d4986adf6a4c74626a5c43589d26ae"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bazelbuild/bazelisk/releases/download/v#{version}/bazelisk-darwin-amd64"
    sha256 "cee2dd6f98a3c164303cfcad97e955d51e609993476572e7ccba2b571ed2c78f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bazelbuild/bazelisk/releases/download/v#{version}/bazelisk-linux-amd64"
    sha256 "c50d662dcec8832eca56be673f5f9eef31d66a82d47762f46c7a7cd63edfa314"
  end

  def install
    bin.install "bazelisk-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}" => "bazelisk"
    bin.install_symlink "bazelisk" => "bazel"
  end

  test do
    assert_match "Bazelisk version: #{version}", shell_output("#{bin}/bazelisk version")
  end
end
