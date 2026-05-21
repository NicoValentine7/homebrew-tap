class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code and Codex rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.13.2/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "31245c21f5747c72db23d25d8e622ef01880133a0ea429405fea06a18332f94f"
  version "0.13.2"
  license "MIT"

  depends_on :macos

  def install
    bin.install "ccrw"
  end

  def caveats
    <<~EOS
      To start, run:
        ccrw

      Launch at Login is enabled automatically on first run.
      You can toggle it off in the popover menu.

      To uninstall completely:
        brew uninstall claude-code-rate-watcher
        rm -f ~/Library/LaunchAgents/com.claude-code-rate-watcher.plist
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccrw --version")
  end
end
