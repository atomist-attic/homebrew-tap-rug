class RugCli < Formula
  desc "Atomist rug command-line interface."
  homepage "https://github.com/atomist/rug-cli"
  url "https://#{ENV["ATOMIST_REPO_USER"]}:#{ENV["ATOMIST_REPO_TOKEN"]}@atomist.jfrog.io/atomist/libs-release/com/atomist/rug-cli/0.10.2/rug-cli-0.10.2-bin.tar.gz"
  sha256 "b3d073d328a76ddf888dc02700f7cadaf81aa0a674a1e76b169fd35d27853b1c"
  head "https://github.com/atomist/rug-cli.git"

  bottle :unneeded

  depends_on :java => "1.8+"
  depends_on "maven"

  def install
    if build.head?
      system "mvn", "--settings", ".settings.xml", "-B", "-V", "package", "-DskipTests"
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
