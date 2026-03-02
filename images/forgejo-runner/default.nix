{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.forgejo-runner;
  name = "forgejo-runner";
  tag = pkgs.forgejo-runner.version;
  entrypoint = [ "${pkgs.forgejo-runner}/bin/act_runner" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ docker-client git cacert bash ];

  labels = {
    "org.opencontainers.image.title" = "Forgejo Runner";
    "org.opencontainers.image.description" = "CI/CD runner for Forgejo";
    "org.opencontainers.image.version" = pkgs.forgejo-runner.version;
  };
}
