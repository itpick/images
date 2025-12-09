{ pkgs, lib, ... }:

# TODO: Add tests for secrets-store-csi-driver-provider-aws-fips image
{
  name = "secrets-store-csi-driver-provider-aws-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secrets-store-csi-driver-provider-aws-fips"
    exit 1
  '';
}
