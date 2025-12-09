{ pkgs, lib, ... }:

# TODO: Add tests for openbao-k8s-fips image
{
  name = "openbao-k8s-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openbao-k8s-fips"
    exit 1
  '';
}
