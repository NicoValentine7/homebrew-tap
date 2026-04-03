class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.11.1/claude-code-rate-watcher-macos-app.tar.gz"
  sha256 "bc1972521edde01c9a80a7b3fa30b7b911d18df5dd22951392f52d1fd6ce3ee3"
  version "0.11.1"
  license "MIT"

  depends_on :macos

  def install
    app_name = "Claude Code Rate Watcher.app"
    prefix.install buildpath/app_name
    (bin/"ccrw").write_env_script prefix/app_name/"Contents/MacOS/ccrw", {}
  end

  def caveats
    <<~EOS
      To start Claude Code Rate Watcher, run:

        ccrw

      Launch at Login is enabled automatically on first run.
      You can toggle it off in the popover menu.

      To uninstall completely:
        brew uninstall claude-code-rate-watcher
        rm -f ~/Library/LaunchAgents/com.claude-code-rate-watcher.plist
    EOS
  end

  test do
    assert_predicate prefix/"Claude Code Rate Watcher.app", :exist?
  end
end
