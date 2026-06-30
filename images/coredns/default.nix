{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for coredns:
# Packages available in nixpkgs:
#   pkgs.coredns  # coredns-1.13 (1.13.1-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

let
  # The cmd points -conf at /etc/coredns/Corefile, but nothing baked that file —
  # CoreDNS exits ("Corefile:1 - Error ... no such file"). Bake a minimal
  # nonroot-runnable Corefile (the Go binary ships no /etc, so no shadowing):
  # serve on :5353 (>1024, since the nonroot user can't bind the privileged :53)
  # with the self-contained `whoami` responder and health/ready endpoints. No
  # upstream or writable dir is needed. Operators mount their own Corefile (a
  # ConfigMap at /etc/coredns/Corefile) and run on :53 with capabilities.
  corefile = pkgs.writeTextDir "etc/coredns/Corefile" ''
    .:5353 {
        whoami
        health :8080
        ready :8181
        log
        errors
    }
  '';

in
mkImage {
  drv = pkgs.coredns;
  name = "coredns";
  tag = "v${pkgs.coredns.version}";
  entrypoint = [ "${pkgs.coredns}/bin/coredns" ];
  cmd = [ "-conf" "/etc/coredns/Corefile" ];

  extraPkgs = [ corefile ];

  labels = {
    "org.opencontainers.image.title" = "CoreDNS";
    "org.opencontainers.image.description" = "DNS server that runs middleware for Kubernetes service discovery";
    "org.opencontainers.image.version" = pkgs.coredns.version;
    "io.nix-containers.chart" = "coredns";
  };
}
