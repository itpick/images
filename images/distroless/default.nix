# distroless
# =============
# Minimal "distroless" base image
# Similar to Google's distroless images - minimal runtime without shell or package manager
# Used as a base for secure, minimal container images

{ nix2container, lib, buildEnv, pkgs, base, ... }:

# This is a minimal base image that contains only the essential
# runtime libraries needed to run most applications.
# No shell, no package manager - just the bare minimum.

let
  # Minimal set of packages for runtime support
  distrolessPackages = with pkgs; [
    cacert      # SSL CA certificates
    tzdata      # Timezone data
  ];

in
nix2container.buildImage {
  name = "distroless";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "distroless-root";
      paths = distrolessPackages;
    })
  ];

  config = {
    User = "65532:65532";  # nonroot user
    Env = [
      "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      "TZDIR=${pkgs.tzdata}/share/zoneinfo"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "Distroless";
      "org.opencontainers.image.description" = "Minimal distroless base image with no shell or package manager";
    };
  };
}
