{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for coredns:
# Packages available in nixpkgs:
#   pkgs.coredns  # coredns-1.13 (1.13.1-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.coredns;
  name = "coredns";
  tag = "v${pkgs.coredns.version}";
  entrypoint = [ "${pkgs.coredns}/bin/coredns" ];
  cmd = [ "-conf" "/etc/coredns/Corefile" ];

  labels = {
    "org.opencontainers.image.title" = "CoreDNS";
    "org.opencontainers.image.description" = "DNS server that runs middleware for Kubernetes service discovery";
    "org.opencontainers.image.version" = pkgs.coredns.version;
    "io.nix-containers.chart" = "coredns";
  };
}
