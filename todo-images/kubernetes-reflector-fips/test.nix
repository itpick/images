{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-reflector-fips image
{
  name = "kubernetes-reflector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-reflector-fips"
    exit 1
  '';
}
