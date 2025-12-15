{ mkImage, pkgs, nonRoot, ... }:

# KubeVela Core FIPS - Application delivery platform core controller (FIPS variant)
# Deploy and operate applications in hybrid, multi-cloud environments

mkImage {
  drv = pkgs.kubevela;
  name = "kubevela-vela-core-fips";
  tag = "v${pkgs.kubevela.version}";

  entrypoint = [ "${pkgs.kubevela}/bin/vela" ];
  cmd = [ "controller" ];

  env = {
    HOME = "/home/${nonRoot.user.name}";
    GOFIPS = "1";
  };

  labels = {
    "org.opencontainers.image.title" = "KubeVela Core FIPS";
    "org.opencontainers.image.description" = "Application delivery platform core controller (FIPS)";
    "org.opencontainers.image.version" = pkgs.kubevela.version;
  };

  user = nonRoot.userString;
}
