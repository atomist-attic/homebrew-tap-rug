require 'formula'

class Rugshell < Formula
  homepage 'http://github.com/atomist/rug-shell/'
  url 'https://repo.spring.io/${repo}/org/springframework/boot/spring-boot-cli/1.0.0-SNAPSHOT/spring-boot-cli-1.0.0-SNAPSHOT-bin.tar.gz'
  version '1.0.0-SNAPSHOT'
  sha256 '423dd7edd23e7ed22f7b7c5d8a3b86760405d969699f8a165610cf6b2863fa5f'

  def install
    root = '.'

    bin.install Dir["#{root}/bin/rug-shell"]
    lib.install Dir["#{root}/lib/rug-shell-*.jar"]
  end
end
