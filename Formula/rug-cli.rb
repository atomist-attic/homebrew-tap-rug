class RugCli < Formula
  desc "CLI for creating and running Rugs"
  homepage "https://github.com/atomist/rug-cli"
  url "https://atomist.jfrog.io/atomist/libs-release/com/atomist/rug-cli/1.0.0-m.6/rug-cli-1.0.0-m.6-bin.tar.gz"
  sha256 "54814a29ec4e906bb6de96e1850dc13af0900cc4e5f9be39ef53cce81286c8c5"
  head "https://github.com/atomist/rug-cli.git"
  version "1.0.0-m.6"

  bottle :unneeded

  depends_on :java => "1.8+"
  depends_on "maven" => :build
  depends_on "node" => :recommended

  def install
    if build.head?
      system "mvn", "-B", "-V", "package", "-DskipTests"
      libexec.install Dir["target/rug-cli-*-SNAPSHOT-bin/rug-cli-*-SNAPSHOT/*"]
    else
      libexec.install Dir["*"]
    end
    bin.install_symlink "#{libexec}/bin/rug"
    bash_completion.install "#{libexec}/etc/bash_completion.d/rug"
  end

  test do
    assert File.exist? "#{bin}/rug"
    if not build.head?
      assert_match version.to_s, shell_output("#{bin}/rug --version 2>&1", 0)
    end
  end
end
