class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "f64d665f630d317edf972619011cc0e9c93ab3ecd8b741243cc6b2e0b9d3f308"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.0"
    sha256 cellar: :any_skip_relocation, monterey: "ae46ebdad3ecf9a50fc2e0093866c90a76652f0071453ca36d93a99d6947569b"
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
