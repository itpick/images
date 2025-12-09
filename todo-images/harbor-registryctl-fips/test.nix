{ pkgs, lib, ... }:

# TODO: Add tests for harbor-registryctl-fips image
{
  name = "harbor-registryctl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-registryctl-fips"
    exit 1
  '';
}
