class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6e4d5ca3d455e13af81e8386c0e27197ba46424c4a3ae2e7b6518d6589d70678"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.1"
    sha256 cellar: :any_skip_relocation, monterey: "75dbefe10555ef930e9f600b584953747cf5bf587cd5fe8d885565a62a982eca"
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"appcu", "generate_config"
    assert_predicate testpath/".config/appcu/config.yaml", :exist?
  end
end
