require 'formula'

class RugCli < Formula
  homepage 'http://github.com/atomist/rug-cli/'
  url 'https://github.com/atomist/homebrew-tap/releases/download/0.5.1-20161014150246/rug-cli-0.0.1-20161014150246-bin.tar.gz'
  version '0.0.1-20161014150246'
  sha256 '74a797332592798f648a68d1f0824a6a269eceaf624e83f2d75bd46bfe4a133c'

  def install
    root = '.'

    bin.install Dir["#{root}/bin/rug-cli"]
    lib.install Dir["#{root}/lib/rug-cli-*.jar"]
  end
end
