class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "a4bc03249d2efbd0ffda827948eb5861e74ac3f9bdeaf18f61bcce4945a9ef1a"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.6"
    sha256 cellar: :any_skip_relocation, monterey: "68084cf004fd62ea0229e4b59fff268553be9b48f3da935ef93cca1ed1ab43cb"
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
