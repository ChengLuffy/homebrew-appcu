class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "de13c239842aed259bed2b147ad4f1137ad68df4f46c522bc3a172c94908b167"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.9"
    sha256 cellar: :any_skip_relocation, monterey: "d86446dfe2096e4cca00053a9d2a685e16a93c1ae62b80172e01b9a5ffdea96a"
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
