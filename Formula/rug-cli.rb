class RugCli < Formula
  desc "CLI for creating and running Rugs"
  homepage "https://github.com/atomist/rug-cli"
  url "https://atomist.jfrog.io/atomist/libs-release/com/atomist/rug-cli/0.24.0/rug-cli-0.24.0-bin.tar.gz"
  sha256 "116c691152f6727929adc71fdcf8739d40324c924404b7e850b958fc585d4652"
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
