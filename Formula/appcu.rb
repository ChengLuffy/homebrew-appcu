class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "88cee4be7f33c09468467e8fc311cbbb85756b6a94e53c02410b824223a62ca8"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.0"
    sha256 cellar: :any_skip_relocation, monterey: "19aa8180ee2b5e54794a641a51cb642d878da8f1a70493b47876eece90ec65ad"
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
