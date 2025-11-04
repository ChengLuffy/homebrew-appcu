class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4868043b617c264497a648c38f6cc213566a236cdb221d4b3b95706314f5ff04"
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
    assert_path_exists testpath/".config/appcu/config.yaml"
  end
end
