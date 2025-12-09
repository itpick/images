{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-livenessprobe-fips image
{
  name = "kubernetes-csi-livenessprobe-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-livenessprobe-fips"
    exit 1
  '';
}
