{ mkImage, pkgs, nonRoot, ... }:

# KubeVela Core - Application delivery platform core controller
# Deploy and operate applications in hybrid, multi-cloud environments

mkImage {
  drv = pkgs.kubevela;
  name = "kubevela-vela-core";
  tag = "v${pkgs.kubevela.version}";

  entrypoint = [ "${pkgs.kubevela}/bin/vela" ];
  cmd = [ "controller" ];

  env = {
    HOME = "/home/${nonRoot.user.name}";
  };

  labels = {
    "org.opencontainers.image.title" = "KubeVela Core";
    "org.opencontainers.image.description" = "Application delivery platform core controller for hybrid multi-cloud";
    "org.opencontainers.image.version" = pkgs.kubevela.version;
  };

  user = nonRoot.userString;
}
