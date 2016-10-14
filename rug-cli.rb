require 'formula'

class RugCli < Formula
  homepage 'http://github.com/atomist/rug-cli/'
  url 'https://github.com/atomist/homebrew-tap/releases/download/0.0.1-20161014023810/rug-cli-0.0.1-20161014023810-bin.tar.gz'
  version '0.0.1-20161014023810'
  sha256 'f0ef2a6f46dd3712d1e75f44e01eb16273f1e7ca8a276ed8c0f1e7199de8f0be'

  def install
    root = '.'

    bin.install Dir["#{root}/bin/rug-cli"]
    lib.install Dir["#{root}/lib/rug-cli-*.jar"]
  end
end
