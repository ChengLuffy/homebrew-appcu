class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "a17b2037f7a066232d0c22bc7ec846f905628fbbe62cad11f865f6394c9ab071"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.6"
    sha256 cellar: :any_skip_relocation, monterey: "bae54ee8890a88eed15d85e7bb47458e69833fa79ddab6e1e31d5777b4d37822"
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
