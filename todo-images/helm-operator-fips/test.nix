{ pkgs, lib, ... }:

# TODO: Add tests for helm-operator-fips image
{
  name = "helm-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for helm-operator-fips"
    exit 1
  '';
}
