class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "243e3ddf1c3ad0b66bb177c932e30eede044d057a20aafe6da5a01ff70adf136"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.2.0"
    sha256 cellar: :any_skip_relocation, monterey: "b3ed1e0cc463d465b6301d069f4fe8cf091a784e67c02de4fdda7749885efd4a"
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
