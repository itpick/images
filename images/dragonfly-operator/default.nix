{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for dragonfly-operator:
# Packages NOT in nixpkgs:
#   dragonfly-operator (1.3.1-r1)

let
  version = "1.1.11";
  operator = buildGoModule {
    pname = "dragonfly-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "dragonflydb";
      repo = "dragonfly-operator";
      rev = "v${version}";
      hash = "sha256-7VpYKg/VsMDhLzHTW93+02MzgTZHRHZwL3uHZnQPOS0=";
    };

    vendorHash = "sha256-C4CkrpLK6yMLhOx3vJKFUhOtF0Ht68I8DqCRJm1vbVA=";

    env.CGO_ENABLED = 0;

    postInstall = ''
      mkdir -p $out/usr/bin
      mv $out/bin/cmd $out/usr/bin/manager
      rm -rf $out/bin
    '';

    doCheck = false;

    meta = with lib; {
      description = "A Kubernetes operator to install and manage Dragonfly instances";
      homepage = "https://github.com/dragonflydb/dragonfly-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  # The derivation containing our binary
  drv = operator;
  
  # Optional: override defaults
  name = "dragonfly-operator";
  tag = "v${version}";
  entrypoint = [ "/usr/bin/manager" ];
  
  # Optional: labels for OCI metadata
  labels = {
    "org.opencontainers.image.title" = "Dragonfly Operator";
    "org.opencontainers.image.description" = "A Kubernetes operator to install and manage Dragonfly instances";
    "org.opencontainers.image.version" = version;
  };
}