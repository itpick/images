{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  cosignPackages = with pkgs; [
    cosign
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "cosign";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "cosign-root";
      paths = base.basePackages ++ cosignPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cosignPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Container signing tool with support for OCI registry";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.cosign.version;
      "io.nix-containers.image.upstream" = "https://sigstore.dev/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "cosign,signing,security,sigstore";
    };
  };
}