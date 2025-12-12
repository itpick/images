# cert-manager FIPS - Automatic TLS certificate management for Kubernetes (FIPS 140-3 compliant)
# https://github.com/cert-manager/cert-manager
#
# This package builds all cert-manager components with FIPS 140-3 compliance
# using Google's BoringCrypto module via GOEXPERIMENT=boringcrypto
# - cert-manager-controller: The main controller that manages certificates
# - cert-manager-webhook: Validating and mutating webhook
# - cert-manager-cainjector: CA bundle injector
# - cert-manager-acmesolver: HTTP-01 challenge solver

{ lib, fetchFromGitHub, buildGoModule, symlinkJoin }:

let
  version = "1.16.2";

  src = fetchFromGitHub {
    owner = "cert-manager";
    repo = "cert-manager";
    rev = "v${version}";
    hash = "sha256-DTwkqHa1cNaw8tRMABKOfdc76k+ecxrQROxhnjFzkno=";
  };

  commonAttrs = {
    inherit version src;
    # Enable CGO for BoringCrypto
    env.CGO_ENABLED = 1;
    # Enable FIPS mode via BoringCrypto
    env.GOEXPERIMENT = "boringcrypto";
    subPackages = [ "." ];
    doCheck = false;
    meta = with lib; {
      description = "Automatically provision and manage TLS certificates in Kubernetes (FIPS 140-3 compliant)";
      homepage = "https://github.com/cert-manager/cert-manager";
      license = licenses.asl20;
    };
  };

  controller = buildGoModule (commonAttrs // {
    pname = "cert-manager-controller-fips";
    modRoot = "cmd/controller";
    vendorHash = "sha256-UlSi7LS3mRjqKGtDvQCkakB95H4tTe184zRnsraYud8=";
    ldflags = [
      "-s" "-w"
      "-X github.com/cert-manager/cert-manager/pkg/util.AppVersion=${version}"
    ];
    postInstall = ''
      mv $out/bin/controller-binary $out/bin/cert-manager-controller
    '';
  });

  cainjector = buildGoModule (commonAttrs // {
    pname = "cert-manager-cainjector-fips";
    modRoot = "cmd/cainjector";
    vendorHash = "sha256-PmJo+7Fbz5lgRdwp1r7cuAjVzj5GPQbIoNPj1lqFN3I=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/cainjector-binary $out/bin/cert-manager-cainjector
    '';
  });

  webhook = buildGoModule (commonAttrs // {
    pname = "cert-manager-webhook-fips";
    modRoot = "cmd/webhook";
    vendorHash = "sha256-03WhvH941HeeHsKHjiphdc7fzLGwts/et8RjZ/OYOTg=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/webhook-binary $out/bin/cert-manager-webhook
    '';
  });

  acmesolver = buildGoModule (commonAttrs // {
    pname = "cert-manager-acmesolver-fips";
    modRoot = "cmd/acmesolver";
    vendorHash = "sha256-kW1ghz1AzgHxP5vNEfgo3ew/DxKFZsT5R9ELYm95nnc=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/acmesolver-binary $out/bin/cert-manager-acmesolver
    '';
  });

in symlinkJoin {
  name = "cert-manager-fips-${version}";
  paths = [ controller cainjector webhook acmesolver ];
  passthru = {
    inherit version controller cainjector webhook acmesolver;
    isFips = true;
  };
}
