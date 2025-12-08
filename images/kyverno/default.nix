{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.kyverno;
  name = "kyverno";
  tag = "v${pkgs.kyverno.version}";
  entrypoint = [ "${pkgs.kyverno}/bin/kyverno" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno";
    "org.opencontainers.image.description" = "Kubernetes native policy engine";
    "org.opencontainers.image.version" = pkgs.kyverno.version;
    "io.nix-containers.chart" = "kyverno";
  };
}
