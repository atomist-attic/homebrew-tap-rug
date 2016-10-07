require 'formula'

class Rugshell < Formula
  homepage 'http://github.com/atomist/rug-shell/'
  url 'https://github.com/atomist/homebrew-tap/releases/download/1.0.0-SNAPSHOT/rug-shell-1.0.0-SNAPSHOT-bin.tar.gz'
  version '1.0.0-SNAPSHOT'
  sha256 '82f3e3064d124daaa7b36b79ec768db4792a4d69afea8bd1aac28100da987faf'

  def install
    root = '.'

    bin.install Dir["#{root}/bin/rug-shell"]
    lib.install Dir["#{root}/lib/rug-shell-*.jar"]
  end
end
