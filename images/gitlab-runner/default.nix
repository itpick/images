{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.gitlab-runner;
  name = "gitlab-runner";
  tag = "v${pkgs.gitlab-runner.version}";
  entrypoint = [ "${pkgs.gitlab-runner}/bin/gitlab-runner" ];
  cmd = [ "run" ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Runner";
    "org.opencontainers.image.description" = "GitLab CI/CD runner";
    "org.opencontainers.image.version" = pkgs.gitlab-runner.version;
    "io.nix-containers.chart" = "gitlab-runner";
  };
}
