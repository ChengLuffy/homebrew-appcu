class Appcu < Formula
  desc "一个用于检查 macOS 应用更新的 CLI 工具"
  homepage "https://github.com/ChengLuffy/application_check_update"
  url "https://github.com/ChengLuffy/application_check_update/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "3388f9063ace9822c0dda00946f50ec5e58c2a0cc2e4b761ad970db13271afeb"
  license "MIT"

  bottle do
    root_url "https://github.com/ChengLuffy/homebrew-appcu/releases/download/appcu-0.1.4"
    sha256 cellar: :any_skip_relocation, monterey: "c31a3bb59cb7a6a253c7114f2d45d8179e95229e28282f80b4d0d42e9c0eeb56"
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
