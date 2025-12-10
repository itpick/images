{ mkImage, gitlab-shell, openssh, bash, coreutils, ... }:

# Chainguard SBOM packages for gitlab-shell:
# Using nixpkgs.gitlab-shell

mkImage {
  drv = gitlab-shell;
  name = "gitlab-shell";
  tag = gitlab-shell.version or "latest";
  entrypoint = [ "${gitlab-shell}/bin/gitlab-shell" ];
  cmd = [];

  extraPkgs = [ openssh bash coreutils ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Shell";
    "org.opencontainers.image.description" = "GitLab Shell handles git SSH sessions for GitLab";
    "org.opencontainers.image.source" = "https://gitlab.com/gitlab-org/gitlab-shell";
  };
}
