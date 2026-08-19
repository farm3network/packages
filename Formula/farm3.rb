class Farm3 < Formula
  desc "Farm3 CLI (provider/consumer node runner)"
  homepage "https://github.com/farm3network/packages"
  version "X.Y.Z" # bump per release

  on_macos do
    on_arm do
      url "https://github.com/farm3network/packages/releases/download/vX.Y.Z/farm3-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
    on_intel do
      url "https://github.com/farm3network/packages/releases/download/vX.Y.Z/farm3-darwin-amd64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/farm3network/packages/releases/download/vX.Y.Z/farm3-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
    on_intel do
      url "https://github.com/farm3network/packages/releases/download/vX.Y.Z/farm3-linux-amd64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
  end

  def install
    bin.install "farm3"
    bin.install "farm3-provider"
    bin.install "farm3-consumer"
  end

  test do
    system "#{bin}/farm3", "run", "provider", "-h"
  end
end
