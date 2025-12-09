{ pkgs, lib, ... }:

# TODO: Add tests for helm-fips image
{
  name = "helm-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for helm-fips"
    exit 1
  '';
}
