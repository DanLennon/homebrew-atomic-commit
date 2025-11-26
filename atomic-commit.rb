class AtomicCommit < Formula
  desc "Track uncommitted changes in git repositories with visual indicators"
  homepage "https://github.com/DanLennon/atomic-commit"
  url "https://github.com/DanLennon/atomic-commit/archive/v1.0.0.tar.gz"
  sha256 "80d07501130ed434d5eea4e712d6c9b009fe5deb10955b804d54f304f47d6f5c"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"atomic-commit", "--help"
  end

  def caveats
    <<~EOS
      To integrate with your shell prompt, add to ~/. zshrc:

        setopt PROMPT_SUBST
        RPROMPT='$(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && atomic-commit 2>/dev/null)'

      Then run: source ~/.zshrc
    EOS
  end
end
