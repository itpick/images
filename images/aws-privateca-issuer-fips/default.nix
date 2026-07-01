{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-privateca-issuer-fips
# AWS Kubernetes component

let
  version = "1.9.0";
  aws-component = buildGoModule {
    pname = "aws-privateca-issuer-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "cert-manager";
      repo = "aws-privateca-issuer";
      rev = "v${version}";
      hash = "sha256-HZ5gcVIrKRGFzMSl81SKroIBhyozAF/lx+NVOKRKd/8=";
    };

    proxyVendor = true;
    vendorHash = "sha256-psUI7Ciguk/V2Dg9caN7ozRJtQfbtH8Sz1REp1pwyC0=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = aws-component;
  name = "aws-privateca-issuer-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/privateca-issuer" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws privateca issuer";
    "org.opencontainers.image.description" = "AWS aws-privateca-issuer component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
