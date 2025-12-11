# wolfi
# =============
# Wolfi-compatible base image
# A minimal base image similar to Chainguard's Wolfi
# Provides a lightweight but functional Linux environment

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Wolfi is a minimal Linux distribution designed for containers.
# This provides a compatible base with essential runtime tools.

let
  baseRuntimePackages = with pkgs; [
    # Essential runtime
    busybox       # Provides sh and basic utilities
    cacert        # SSL CA certificates
    tzdata        # Timezone data

    # C library and runtime
    # (provided by nix base)
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "wolfi";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "wolfi-root";
      paths = base.basePackages ++ baseRuntimePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath baseRuntimePackages}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    ];
    Entrypoint = [ "${pkgs.busybox}/bin/sh" ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "Wolfi Base";
      "org.opencontainers.image.description" = "Minimal Wolfi-compatible base image for containers";
    };
  };
}
