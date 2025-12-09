{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-policy-controller-fips image
{
  name = "sigstore-policy-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-policy-controller-fips"
    exit 1
  '';
}
