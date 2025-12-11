{ mkImage, pkgs, lib, ... }:

# GitHub CLI - GitHub command line tool
# https://cli.github.com/

mkImage {
  drv = pkgs.gh;
  name = "gh";
  tag = "v${pkgs.gh.version}";
  entrypoint = [ "${pkgs.gh}/bin/gh" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "GitHub CLI";
    "org.opencontainers.image.description" = "GitHub's official command line tool";
    "org.opencontainers.image.version" = pkgs.gh.version;
  };
}
