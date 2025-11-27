class AtomicCommit < Formula
  desc "Track uncommitted changes in git repositories with visual indicators"
  homepage "https://github.com/DanLennon/atomic-commit"
  url "https://github.com/DanLennon/atomic-commit/archive/v1.0.2.tar.gz"
  sha256 "60fbac1b57ddee8b75a36c2ff8d854b9de3637a33d0e97518e028a3a59859b9c"
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