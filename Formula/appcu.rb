class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "3a223bc7f1fa52056081407c79493b4ee883a66f7cf2b23d2f1fcb3f4f715f70"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.5"
    sha256 cellar: :any_skip_relocation, monterey: "a186ce4df5cb38e575ba8e7278b882edf675db32abe16d168585eaa8ffd37e06"
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
