{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.shellcheck;
  name = "shellcheck";
  tag = "v${pkgs.shellcheck.version}";
  entrypoint = [ "${pkgs.shellcheck}/bin/shellcheck" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ShellCheck";
    "org.opencontainers.image.description" = "Static analysis tool for shell scripts";
    "org.opencontainers.image.version" = pkgs.shellcheck.version;
    "io.nix-containers.chart" = "argocd";
  };
}
