{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for oauth2-proxy:
# Packages available in nixpkgs:
#   pkgs.oauth2-proxy  # oauth2-proxy (7.13.0-r2)

mkImage {
  drv = pkgs.oauth2-proxy;
  name = "oauth2-proxy";
  tag = "v${pkgs.oauth2-proxy.version}";
  entrypoint = [ "${pkgs.oauth2-proxy}/bin/oauth2-proxy" ];
  # Was `--help` (a one-shot). Run the proxy with a self-contained default
  # config (all flags, no config file, no writable dir): bind 0.0.0.0:4180, a
  # `static://200` upstream (no real backend), and the google provider with
  # placeholder credentials — the google provider does no startup discovery, so
  # it starts and serves the sign-in page without contacting any IdP. Operators
  # override --provider/--client-id/--client-secret/--upstream/--redirect-url
  # and a real --cookie-secret for production.
  cmd = [
    "--http-address=0.0.0.0:4180"
    "--upstream=static://200"
    "--provider=google"
    "--client-id=placeholder-client-id"
    "--client-secret=placeholder-client-secret"
    "--cookie-secret=0123456789abcdef0123456789abcdef"
    "--cookie-secure=false"
    "--email-domain=*"
  ];

  labels = {
    "org.opencontainers.image.title" = "OAuth2 Proxy";
    "org.opencontainers.image.description" = "Reverse proxy that provides authentication with various providers";
    "org.opencontainers.image.version" = pkgs.oauth2-proxy.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
