# cfssl-self-sign
# =============
# CFSSL self-signing certificate generation image
# Used by GitLab and other Helm charts for TLS certificate generation
# https://github.com/cloudflare/cfssl

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Chainguard SBOM packages for cfssl-self-sign:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cfssl  # cfssl (1.6.5-r25)

let
  cfsslPackages = with pkgs; [
    cfssl        # CFSSL toolkit (includes cfssl, cfssljson, etc.)
    busybox      # Basic shell utilities
    bash         # Shell for scripts
    coreutils    # Standard utilities
    openssl      # For additional cert operations
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "cfssl-self-sign";
  tag = pkgs.cfssl.version;

  copyToRoot = [
    (buildEnv {
      name = "cfssl-self-sign-root";
      paths = base.basePackages ++ cfsslPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cfsslPackages}"
    ];
    Entrypoint = [ "${pkgs.cfssl}/bin/cfssl" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "CFSSL Self-Sign";
      "org.opencontainers.image.description" = "CFSSL toolkit for self-signed certificate generation";
      "org.opencontainers.image.version" = pkgs.cfssl.version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
