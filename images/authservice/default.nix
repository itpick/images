# authservice
# =============
# Istio Authservice - OIDC authentication for Istio/Envoy
# https://github.com/istio-ecosystem/authservice

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Authservice implements Envoy External Authorization for OIDC authentication

let
  version = "1.1.4";
  authservice = buildGoModule {
    pname = "authservice";
    inherit version;

    src = fetchFromGitHub {
      owner = "istio-ecosystem";
      repo = "authservice";
      rev = "v${version}";
      hash = "sha256-6vB8SevG1RVxfcLtja41vS1u/6Srg9NTBv1PHVhzMqQ=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/authservice" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Istio Authservice - OIDC authentication for Istio/Envoy";
      homepage = "https://github.com/istio-ecosystem/authservice";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = authservice;
  name = "authservice";
  tag = "v${version}";
  entrypoint = [ "${authservice}/bin/authservice" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Authservice";
    "org.opencontainers.image.description" = "OIDC authentication service for Istio/Envoy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "authservice";
  };
}
