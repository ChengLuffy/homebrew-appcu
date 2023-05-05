class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "e219bb3bb2cd6057108493c32753e00e88c258811a1d05df80b393dae2d9de4c"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.7"
    sha256 cellar: :any_skip_relocation, monterey: "74c9cf2210674ad9d3f15d469477ff135faafb946354bd329279534d8cf0c5b6"
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
