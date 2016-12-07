class RugCli < Formula
  desc "CLI for creating and running Rugs"
  homepage "https://github.com/atomist/rug-cli"
  url "https://atomist.jfrog.io/atomist/libs-release/com/atomist/rug-cli/0.16.2/rug-cli-0.16.2-bin.tar.gz"
  sha256 "194c5e36df23135d202d4792d0bb5e52e54665eac88884931f83ea28c5693479"
  head "https://github.com/atomist/rug-cli.git"

  bottle :unneeded

  depends_on :java => "1.8+"
  depends_on "maven"

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
