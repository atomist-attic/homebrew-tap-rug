class RugCli < Formula
  desc "CLI for creating and running Rugs"
  homepage "https://github.com/atomist/rug-cli"
  url "https://atomist.jfrog.io/atomist/libs-release/com/atomist/rug-cli/0.30.1/rug-cli-0.30.1-bin.tar.gz"
  sha256 "591769a266dc57dac5fdd0c11eb88227f08b4bda40c79362d1662873cd7c0e09"
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
