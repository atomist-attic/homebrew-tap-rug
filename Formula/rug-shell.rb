require 'formula'

class RugShell < Formula
  homepage 'http://github.com/atomist/rug-shell/'
  url 'https://github.com/atomist/homebrew-tap/releases/download/1.0.0-20161007150228/rug-shell-1.0.0-20161007150228-bin.tar.gz'
  version '1.0.0-20161007150228'
  sha256 '147af7c7c5b7a7cf7b996291f300939bf262589fabe493ac1b67ace7f01fd51e'

  def install
    root = '.'

    bin.install Dir["#{root}/bin/rug-shell"]
    lib.install Dir["#{root}/lib/rug-shell-*.jar"]
  end
end
