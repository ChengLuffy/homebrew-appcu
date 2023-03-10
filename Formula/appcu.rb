class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "1e355a67121c7c6e0bf33ae407282f613d31994ef2b7a2788c13160e2f3f0d4a"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.2"
    sha256 cellar: :any_skip_relocation, monterey: "a83c635b5f3b37750077717ab2530590a2a06ebf73386c81005db950d750e124"
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
