{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for envoy:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.envoy  # envoy-1.36 (1.36.3-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.su-exec  # su-exec (0.3-r0)
# Packages NOT in nixpkgs:
#   envoy-1.36-config (1.36.3-r0)
#   envoy-1.36-oci-entrypoint (1.36.3-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

mkImage {
  drv = pkgs.envoy;
  name = "envoy";
  tag = "v${pkgs.envoy.version}";
  entrypoint = [ "${pkgs.envoy}/bin/envoy" ];
  cmd = [ "-c" "/etc/envoy/envoy.yaml" ];

  labels = {
    "org.opencontainers.image.title" = "Envoy";
    "org.opencontainers.image.description" = "Cloud-native edge and service proxy";
    "org.opencontainers.image.version" = pkgs.envoy.version;
    "io.nix-containers.chart" = "envoy";
  };
}
