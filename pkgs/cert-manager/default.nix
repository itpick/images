{ lib, fetchFromGitHub, buildGoModule, symlinkJoin }:

# https://github.com/cert-manager/cert-manager
# cert-manager uses a multi-module structure (each cmd has its own go.mod)
# Binary names are <component>-binary based on module names in go.mod
# So we build each component separately and combine them

let
  goModBump = import ../../lib/goModBump.nix { inherit lib; };

  version = "1.21.3";

  src = fetchFromGitHub {
    owner = "cert-manager";
    repo = "cert-manager";
    rev = "v${version}";
    hash = "sha256-qqUbhmh8kwEOQ3AWJ9pmEv52Jh/FwLjn0bCI02rv5fE=";
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
  } // goModBump [
    "github.com/go-jose/go-jose/v4@v4.1.6"
    "golang.org/x/net@v0.62.0"
  ];

  controller = buildGoModule (commonAttrs // {
    pname = "cert-manager-controller";
    modRoot = "cmd/controller";
    vendorHash = "sha256-Be3P251IogntUKtXquZITW7VrH29XxaZRAn4SAWWjeE=";
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
    vendorHash = "sha256-AtHkmr9pVBacA+YWbgj1R/OaRb5GQGxvDO4G/CwTc7I=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/cainjector-binary $out/bin/cert-manager-cainjector
    '';
  });

  webhook = buildGoModule (commonAttrs // {
    pname = "cert-manager-webhook";
    modRoot = "cmd/webhook";
    vendorHash = "sha256-FuGpVeXHf+8o3fsWyQBTOcwJlwMHQ1kzygZ0xKzwQ/Q=";
    ldflags = [ "-s" "-w" ];
    postInstall = ''
      mv $out/bin/webhook-binary $out/bin/cert-manager-webhook
    '';
  });

  acmesolver = buildGoModule (commonAttrs // {
    pname = "cert-manager-acmesolver";
    modRoot = "cmd/acmesolver";
    vendorHash = "sha256-X4lpP03ssIJeeXeES5wgi/a64798VWbp5ZuLKrDzYJo=";
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
