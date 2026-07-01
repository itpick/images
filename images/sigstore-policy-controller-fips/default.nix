{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-policy-controller-fips
# Sigstore signing component

let
  version = "0.15.1";
  component = buildGoModule {
    pname = "sigstore-policy-controller-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "policy-controller";
      rev = "v${version}";
      hash = "sha256-FV1TWhj479XCEoe0iohc2IIQb6duCLXQOcCHdL4FE2E=";
    };
    vendorHash = "sha256-m4VvZtaDKsOUs4Vc02b8nbR3gS6UL6YdxdCv/by2iiE=";
    subPackages = [ "cmd/webhook" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "sigstore-policy-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/sigstore-policy-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore-policy-controller-fips";
    "org.opencontainers.image.description" = "Sigstore sigstore-policy-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
