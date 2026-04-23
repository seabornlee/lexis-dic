class LexisDic < Formula
  desc "AI-powered English Dictionary for macOS"
  homepage "https://github.com/seabornlee/ai-dic-repos"
  version "1.0.19"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  url "https://github.com/seabornlee/ai-dic-repos/releases/download/v1.0.19/LexisDic-1.0.19.dmg"
  name "LexisDic"
  desc "AI-powered English Dictionary for macOS"
  homepage "https://github.com/seabornlee/ai-dic-repos"
  license "MIT"

  def install
    require "json"
    plist = `/usr/bin/hdiutil attach -nobrowse -plist "#{cached_download}" 2>/dev/null`.chomp
    vol = JSON.parse(plist)["system-entities"].find { |e| e["mount-point"] }["mount-point"]
    FileUtils.cp_r "#{vol}/LexisDic.app", "/Applications/LexisDic.app"
    system "hdiutil", "detach", vol, force: true
  end

  test do
    assert_predicate File.exist?("/Applications/LexisDic.app"), "App should be installed"
  end
end
