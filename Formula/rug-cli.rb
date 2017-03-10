class RugCli < Formula
  desc "CLI for creating and running Rugs"
  homepage "https://github.com/atomist/rug-cli"
  url "https://atomist.jfrog.io/atomist/libs-release/com/atomist/rug-cli/0.25.0/rug-cli-0.25.0-bin.tar.gz"
  sha256 "37518c0b8edba6e0b1b8f0d9ecf7bdbbc632d943510416b4d9e7c980b8e0f74e"
  head "https://github.com/atomist/rug-cli.git"

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
