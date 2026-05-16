class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "36ff55d75edf3e346733f884ccb09697b59aa9ea32c1bb25c88e6febf12e7b0e"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5dc8c4098937701b90a6b9ebf8a935835795eeb02d8c55313236908e417f473b"
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"appcu", "gc"
    assert_path_exists testpath/".config/appcu/config.yaml"
  end
end
