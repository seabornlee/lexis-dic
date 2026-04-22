class LexisDic < Formula
  desc "AI-powered English Dictionary for macOS"
  homepage "https://github.com/seabornlee/ai-dic-repos"
  url "https://github.com/seabornlee/ai-dic-repos/releases/download/v1.0.0/LexisDic-1.0.0.dmg"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  version "1.0.0"
  license "MIT"

  def install
    # Create temporary mount point
    temp_dir = Dir.mktmpdir

    # Mount DMG to temp directory
    system "hdiutil", "attach", url, "-mountpoint", temp_dir, "-nobrowse"

    # Copy app to Applications
    system "cp", "-R", "#{temp_dir}/LexisDic.app", "/Applications/LexisDic.app"

    # Unmount DMG
    system "hdiutil", "detach", temp_dir, "-force"

    # Clean up temp dir
    Dir.rmdir(temp_dir) if Dir.exist?(temp_dir)
  end

  test do
    assert_predicate File.exist?("/Applications/LexisDic.app"), "App should be installed"
  end
end
