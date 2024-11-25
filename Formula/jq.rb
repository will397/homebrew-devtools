class Jq < Formula
  desc "Lightweight and flexible command-line JSON processor"
  homepage "https://stedolan.github.io/jq/"
  version "1.7.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-macos-arm64"
    sha256 "0bbe619e663e0de2c550be2fe0d240d076799d6f8a652b70fa04aea8a8362e8a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-macos-amd64"
    sha256 "4155822bbf5ea90f5c79cf254665975eb4274d426d0709770c21774de5407443"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jqlang/jq/releases/download/jq-#{version}/jq-linux64"
    sha256 "5942c9b0934e510ee61eb3e30273f1b3fe2590df93933a93d7c58b81d19c8ff5"
  end

  def install
    bin.install "jq-#{OS.mac? ? 'macos' : 'linux64'}" => "jq"
    chmod 0755, bin/"jq"
  end

  test do
    assert_match "jq-#{version}", shell_output("#{bin}/jq --version")
  end
end
