class Sshify < Formula
  desc "TUI to manage SSH hosts for the Bitwarden SSH agent"
  homepage "https://github.com/deinoshub/sshify"
  version "0.3.0"
  head "https://github.com/deinoshub/sshify.git", branch: "main"
  depends_on "go" => :build if build.head?

  on_macos do
    on_arm do
      url "https://github.com/deinoshub/sshify/releases/download/v0.3.0/sshify_darwin_arm64.tar.gz"
      sha256 "b2128f75b61e869cbce5d567d96578d86d098680c3b13549ee57b2e426c1714f"
    end
    on_intel do
      url "https://github.com/deinoshub/sshify/releases/download/v0.3.0/sshify_darwin_amd64.tar.gz"
      sha256 "a7f2a476d07b140776fad3b3c02b55dbaf3900c128177248ffc019fbff4c100c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deinoshub/sshify/releases/download/v0.3.0/sshify_linux_arm64.tar.gz"
      sha256 "d57b7023ba92cc88d11036826c3c76de08ba45d75d37c461a3698239e9e91011"
    end
    on_intel do
      url "https://github.com/deinoshub/sshify/releases/download/v0.3.0/sshify_linux_amd64.tar.gz"
      sha256 "019e1777d1869755e5a7ddb5157eb8e7fbe7b591e08909e55bba22ae4a11ae86"
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
