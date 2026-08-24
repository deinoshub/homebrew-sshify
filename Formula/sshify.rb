class Sshify < Formula
  desc "TUI to manage SSH hosts for the Bitwarden SSH agent"
  homepage "https://github.com/deinoshub/sshify"
  version "0.2.0"
  head "https://github.com/deinoshub/sshify.git", branch: "main"
  depends_on "go" => :build if build.head?

  on_macos do
    on_arm do
      url "https://github.com/deinoshub/sshify/releases/download/v0.2.0/sshify_darwin_arm64.tar.gz"
      sha256 "2a4b0418e1f295d54041fa3ab5e8a0b7d36e703a36bc8a58fa44e69960ea0913"
    end
    on_intel do
      url "https://github.com/deinoshub/sshify/releases/download/v0.2.0/sshify_darwin_amd64.tar.gz"
      sha256 "2f0a0bc14a9ccdd2167f331b83585de700ef39f78bc9a4d0b91ee69e7b3eafc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deinoshub/sshify/releases/download/v0.2.0/sshify_linux_arm64.tar.gz"
      sha256 "2314f8bb7d94d58c9f1af56d6796865d40af1785c507e7967faab74923a267f0"
    end
    on_intel do
      url "https://github.com/deinoshub/sshify/releases/download/v0.2.0/sshify_linux_amd64.tar.gz"
      sha256 "5e7fe40feb7f75035a5d8e44a6a811f20b854f6a67ecbeb3e9fc7a9b17d24adf"
    end
  end

  def install
    if build.head?
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=HEAD"), "./cmd/sshify"
    else
      bin.install "sshify"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sshify -v")
  end
end
