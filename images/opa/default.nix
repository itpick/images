{ mkImage, pkgs, lib, ... }:

# Open Policy Agent - General-purpose policy engine
# https://www.openpolicyagent.org/

mkImage {
  drv = pkgs.open-policy-agent;
  name = "opa";
  tag = "v${pkgs.open-policy-agent.version}";
  entrypoint = [ "${pkgs.open-policy-agent}/bin/opa" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "Open Policy Agent";
    "org.opencontainers.image.description" = "General-purpose policy engine for unified policy enforcement";
    "org.opencontainers.image.version" = pkgs.open-policy-agent.version;
  };
}
