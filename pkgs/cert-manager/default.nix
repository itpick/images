{ lib, fetchFromGitHub, buildGoModule, symlinkJoin }:

# https://github.com/cert-manager/cert-manager
# cert-manager uses a multi-module structure (each cmd has its own go.mod)
# Binary names are <component>-binary based on module names in go.mod
# So we build each component separately and combine them

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
    env.CGO_ENABLED = 0;
    subPackages = [ "." ];
    doCheck = false;
    meta = with lib; {
      description = "Automatically provision and manage TLS certificates in Kubernetes";
      homepage = "https://github.com/cert-manager/cert-manager";
      license = licenses.asl20;
    };
  };

  controller = buildGoModule (commonAttrs // {
    pname = "cert-manager-controller";
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
    pname = "cert-manager-cainjector";
    modRoot = "cmd/cainjector";
    vendorHash = "sha256-PmJo+7Fbz5lgRdwp1r7cuAjVzj5GPQbIoNPj1lqFN3I=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/cainjector-binary $out/bin/cert-manager-cainjector
    '';
  });

  webhook = buildGoModule (commonAttrs // {
    pname = "cert-manager-webhook";
    modRoot = "cmd/webhook";
    vendorHash = "sha256-03WhvH941HeeHsKHjiphdc7fzLGwts/et8RjZ/OYOTg=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/webhook-binary $out/bin/cert-manager-webhook
    '';
  });

  acmesolver = buildGoModule (commonAttrs // {
    pname = "cert-manager-acmesolver";
    modRoot = "cmd/acmesolver";
    vendorHash = "sha256-kW1ghz1AzgHxP5vNEfgo3ew/DxKFZsT5R9ELYm95nnc=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/acmesolver-binary $out/bin/cert-manager-acmesolver
    '';
  });

in symlinkJoin {
  name = "cert-manager-${version}";
  paths = [ controller cainjector webhook acmesolver ];
  passthru = {
    inherit version controller cainjector webhook acmesolver;
  };
}
