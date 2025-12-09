{ pkgs, lib, ... }:

# TODO: Add tests for kubelet-csr-approver-fips image
{
  name = "kubelet-csr-approver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubelet-csr-approver-fips"
    exit 1
  '';
}
