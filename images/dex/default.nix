{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for dex:
# Packages available in nixpkgs:
#   pkgs.dex  # dex (2.44.0-r6)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gomplate  # gomplate (4.3.3-r5)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

let
  # Was `version` (a one-shot). `dex serve` needs a config; bake a minimal one
  # at /etc/dex/config.yaml (the Go binary ships no /etc, so no shadowing): the
  # in-memory storage backend, the web server on 0.0.0.0:5556, the password DB
  # with one static admin, and one static OAuth client — so the OIDC provider
  # runs out of the box with no external DB. Operators mount their own config
  # (real storage, connectors, clients).
  dexConfig = pkgs.writeTextDir "etc/dex/config.yaml" ''
    issuer: http://localhost:5556/dex

    storage:
      type: memory

    web:
      http: 0.0.0.0:5556

    staticClients:
      - id: example-app
        name: 'Example App'
        secret: ZXhhbXBsZS1hcHAtc2VjcmV0
        redirectURIs:
          - 'http://127.0.0.1:5555/callback'

    enablePasswordDB: true

    staticPasswords:
      - email: "admin@example.com"
        hash: "$2a$10$2b2cU8CPhOTaGrs1HRQuAueS7JTT5ZHsHSzYiFPm1leZck7Mc8T4G"
        username: "admin"
        userID: "08a8684b-db88-4b73-90a9-3cd1661f5466"
  '';

in
mkImage {
  drv = pkgs.dex-oidc;
  name = "dex";
  tag = "v${pkgs.dex-oidc.version}";
  entrypoint = [ "${pkgs.dex-oidc}/bin/dex" ];
  # Was `version` (a one-shot). Serve the OIDC provider with the baked config;
  # it listens on 0.0.0.0:5556.
  cmd = [ "serve" "/etc/dex/config.yaml" ];

  extraPkgs = with pkgs; [ gomplate dexConfig ];

  labels = {
    "org.opencontainers.image.title" = "Dex";
    "org.opencontainers.image.description" = "OpenID Connect Identity (OIDC) and OAuth 2.0 Provider";
    "org.opencontainers.image.version" = pkgs.dex-oidc.version;
    "io.nix-containers.chart" = "argocd";
  };
}
