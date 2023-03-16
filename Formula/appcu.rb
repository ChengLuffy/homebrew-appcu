class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "2ef569899faad8747c7dd48dce81f676d45f4b87317b8e75ef082fc2a7375c84"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.5"
    sha256 cellar: :any_skip_relocation, monterey: "a0abd1d01c48c783b05160e028686ab5014c238de2adf5e2d548fe982610cc09"
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"appcu", "gc"
    assert_predicate testpath/".config/appcu/config.yaml", :exist?
  end
end
