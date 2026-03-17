class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.7.2/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "2dc52bd45741ccc8af04f081fbfea7737e8559bd3217caee732b2c02a6a7f7ef"
  version "0.7.2"
  license "MIT"

  depends_on :macos

  def install
    bin.install "ccrw"
    bin.install_symlink "ccrw" => "claude-code-rate-watcher"
  end

  def caveats
    <<~EOS
      To start Claude Code Rate Watcher, run:

        ccrw

      On first launch, a .app bundle is created in /Applications so you
      can also launch it from Spotlight or Launchpad.

      Launch at Login is enabled automatically on first run.
      You can toggle it off in the popover menu.

      To uninstall completely:
        brew uninstall claude-code-rate-watcher
        rm -rf "/Applications/Claude Code Rate Watcher.app"
        rm -f ~/Library/LaunchAgents/com.claude-code-rate-watcher.plist
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccrw --version 2>&1", 1)
  end
end
