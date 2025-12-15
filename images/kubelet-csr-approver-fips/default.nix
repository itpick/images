{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kubelet-csr-approver;
  name = "kubelet-csr-approver-fips";
  tag = "latest";
  
  entrypoint = [ "kubelet-csr-approver" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubelet-csr-approver-fips";
    "org.opencontainers.image.description" = "kubelet-csr-approver-fips";
    "org.opencontainers.image.version" = pkgs.kubelet-csr-approver.version;
  };
  
  user = nonRoot.userString;
}
