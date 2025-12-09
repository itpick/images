{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-external-resizer-fips image
{
  name = "kubernetes-csi-external-resizer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-external-resizer-fips"
    exit 1
  '';
}
