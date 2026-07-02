{ mkImage, pkgs, nonRoot, ... }:

# steampipe - SQL over cloud APIs
# https://github.com/turbot/steampipe
#
# nixpkgs steampipe 2.3.6 bundles jackc/pgx v5.7.6 with 4 critical CVEs
# (CVE-2026-33815 / CVE-2026-33816, fixed in pgx 5.9.0+). Override to
# 2.4.4 which pulls pgx v5.9.2.

let
  steampipe = pkgs.steampipe.overrideAttrs (o: rec {
    version = "2.4.4";
    src = pkgs.fetchFromGitHub {
      owner = "turbot";
      repo = "steampipe";
      rev = "v${version}";
      hash = "sha256-sc7Vp7voMUhRqeRcDe4qWa35AawSbZWr3rG5o8Svu3w=";
    };
    vendorHash = "sha256-6i/1w4s3zymlB+qaV6qIzgdjfYfuspgYX81cuG9q9GU=";
  });
in
mkImage {
  drv = steampipe;
  name = "steampipe";
  tag = "v${steampipe.version}";
  entrypoint = [ "steampipe" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "steampipe";
    "org.opencontainers.image.description" = "SQL over cloud APIs";
    "org.opencontainers.image.version" = steampipe.version;
    "io.nix-containers.source" = "nixpkgs+override";
  };

  user = nonRoot.userString;
}
