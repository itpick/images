# cedar
# =============
# Cedar - Policy language and evaluation engine
# https://www.cedarpolicy.com/
#
# Cedar is a language for defining permissions as policies for authorization.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.cedar;
  name = "cedar";
  tag = "v${pkgs.cedar.version}";
  entrypoint = [ "${pkgs.cedar}/bin/cedar" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Cedar";
    "org.opencontainers.image.description" = "Policy language and evaluation engine for authorization";
    "org.opencontainers.image.version" = pkgs.cedar.version;
  };
}
