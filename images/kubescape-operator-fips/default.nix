{ mkImage, pkgs, nonRoot, ... }:

# Kubescape Operator FIPS - Kubernetes security platform operator (FIPS variant)
# Tests Kubernetes clusters for security and compliance

mkImage {
  drv = pkgs.kubescape;
  name = "kubescape-operator-fips";
  tag = "v${pkgs.kubescape.version}";

  entrypoint = [ "${pkgs.kubescape}/bin/kubescape" ];
  cmd = [ "--help" ];

  env = {
    HOME = "/home/${nonRoot.user.name}";
    GOFIPS = "1";
  };

  labels = {
    "org.opencontainers.image.title" = "Kubescape Operator FIPS";
    "org.opencontainers.image.description" = "Kubernetes security platform for testing clusters (FIPS)";
    "org.opencontainers.image.version" = pkgs.kubescape.version;
  };

  user = nonRoot.userString;
}
