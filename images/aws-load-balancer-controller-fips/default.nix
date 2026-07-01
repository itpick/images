{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# AWS Load Balancer Controller (FIPS) - Kubernetes controller for Elastic Load Balancers with FIPS-compliant cryptography
# https://github.com/kubernetes-sigs/aws-load-balancer-controller
# FIPS-compliant build for FedRAMP compliance

let
  version = "2.17.1";

  aws-load-balancer-controller-fips = buildGoModule rec {
    pname = "aws-load-balancer-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "aws-load-balancer-controller";
      rev = "v${version}";
      hash = "sha256-7vMdJc+rGz9AqIHmhrvIvGs3S7Lx5eTWGEA2wOyA1I8=";
    };

    proxyVendor = true;
    vendorHash = "sha256-DiENKnLEXb6sNu9jorKOqbhA9kHV6TWAo8qiGqB2Ie0=";

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X sigs.k8s.io/aws-load-balancer-controller/pkg/version.GitVersion=${version}"
      "-X sigs.k8s.io/aws-load-balancer-controller/pkg/version.GitCommit=${version}"
    ];


    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "AWS Load Balancer Controller (FIPS) - Kubernetes controller for ELBs with FIPS-validated cryptography";
      homepage = "https://github.com/kubernetes-sigs/aws-load-balancer-controller";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = aws-load-balancer-controller-fips;
  name = "aws-load-balancer-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-load-balancer-controller-fips}/bin/aws-load-balancer-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "AWS Load Balancer Controller (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant Kubernetes controller for Elastic Load Balancers";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "aws-load-balancer-controller";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
