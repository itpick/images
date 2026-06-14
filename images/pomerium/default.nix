{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pomerium
# ========
# Identity-aware proxy that enables zero-trust access to applications
# https://github.com/pomerium/pomerium

let
  appPackages = with pkgs; [
    pomerium
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];
in
nix2container.buildImage {
  name = "pomerium";
  tag = "v${pkgs.pomerium.version}";

  copyToRoot = [
    (buildEnv {
      name = "pomerium-root";
      paths = base.basePackages ++ appPackages ++ [ userEnv ];
    })
  ];

  config = {
    Entrypoint = [ "${pkgs.pomerium}/bin/pomerium" ];
    User = "1000:1000";
    ExposedPorts = {
      "443/tcp" = {};
    };
    Labels = {
      "org.opencontainers.image.title"       = "Pomerium";
      "org.opencontainers.image.description" = "Identity-aware proxy that enables zero-trust access to applications";
      "org.opencontainers.image.version"     = pkgs.pomerium.version;
      "org.opencontainers.image.source"      = "https://github.com/pomerium/pomerium";
      "io.nix-containers.build-strategy"     = "nixpkgs-wrapped";
      "io.nix-containers.image.category"     = "security,networking";
    };
  };
}
