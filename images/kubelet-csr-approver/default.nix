{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubelet-csr-approver;
  name = "kubelet-csr-approver";
  tag = "latest";
  
  entrypoint = [ "kubelet-csr-approver" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubelet-csr-approver";
    "org.opencontainers.image.description" = "Last changed 19 hours ago";
    "org.opencontainers.image.version" = pkgs.kubelet-csr-approver.version;
  };
  
  user = nonRoot.userString;
}
