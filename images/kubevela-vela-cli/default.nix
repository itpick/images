{ mkImage, pkgs, nonRoot, ... }:

# KubeVela CLI - Application delivery platform CLI
# Deploy and operate applications in hybrid, multi-cloud environments

mkImage {
  drv = pkgs.kubevela;
  name = "kubevela-vela-cli";
  tag = "v${pkgs.kubevela.version}";

  entrypoint = [ "${pkgs.kubevela}/bin/vela" ];
  cmd = [ "--help" ];

  env = {
    HOME = "/home/${nonRoot.user.name}";
  };

  labels = {
    "org.opencontainers.image.title" = "KubeVela CLI";
    "org.opencontainers.image.description" = "Application delivery platform CLI for hybrid multi-cloud";
    "org.opencontainers.image.version" = pkgs.kubevela.version;
  };

  user = nonRoot.userString;
}
