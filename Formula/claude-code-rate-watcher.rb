class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.13.0/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "82b3fe24c820bcded4aeb72c062c5b4a4dc488e96a224eaf6fcaa4c57d54e87b"
  version "0.13.0"
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
