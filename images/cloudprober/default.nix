{ mkImage, pkgs, lib, ... }:

# cloudprober - Active monitoring software
# https://cloudprober.org/

mkImage {
  drv = pkgs.cloudprober;
  name = "cloudprober";
  tag = "v${pkgs.cloudprober.version}";
  entrypoint = [ "${pkgs.cloudprober}/bin/cloudprober" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "cloudprober";
    "org.opencontainers.image.description" = "Active monitoring software to detect failures before users";
    "org.opencontainers.image.version" = pkgs.cloudprober.version;
  };
}
