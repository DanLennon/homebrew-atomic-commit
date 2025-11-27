class AtomicCommit < Formula
  desc "Track uncommitted changes in git repositories with visual indicators"
  homepage "https://github.com/DanLennon/atomic-commit"
  url "https://github.com/DanLennon/atomic-commit/archive/v1.0.1.tar.gz"
  sha256 "5f1f7d33082cac1b2938fd81862d34fbb87c08fd1664d9d620cac2ea105a5437"
  license "MIT"

  depends_on "python@3.12"
  depends_on "uv"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system Formula["uv"].opt_bin/"uv", "pip", "install", ".", "--python", python, "--prefix", prefix
  end

  test do
    system "#{bin}/atomic-commit", "--help"
  end

  def caveats
    <<~EOS
      To integrate with your shell prompt, add to ~/.zshrc:
        setopt PROMPT_SUBST
        RPROMPT='$(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && atomic-commit 2>/dev/null)'
      Then run: source ~/.zshrc
    EOS
  end
end