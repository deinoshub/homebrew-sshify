class Sshify < Formula
  desc "TUI to manage SSH hosts for the Bitwarden SSH agent"
  homepage "https://github.com/deinoshub/sshify"
  url "https://github.com/deinoshub/sshify/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9d619e75e979d9c6066cdae05e247289180bc0833c5fdbf43d5ba8778ed8c530"
  head "https://github.com/deinoshub/sshify.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/sshify"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sshify -v")
  end
end
