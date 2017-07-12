class RugCli < Formula
  desc "CLI for creating and running Rugs"
  homepage "https://github.com/atomist/rug-cli"
  url "https://atomist.jfrog.io/atomist/libs-release/com/atomist/rug-cli/1.0.0-m.5/rug-cli-1.0.0-m.5-bin.tar.gz"
  sha256 "06a0430b0d5b0413914901f51b554bd5a4fc5b507aaf7132407a385a2b38b37d"
  head "https://github.com/atomist/rug-cli.git"
  version "1.0.0-m.5"

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
