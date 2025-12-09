{ pkgs, lib, ... }:

# TODO: Add tests for cerbos-fips image
{
  name = "cerbos-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cerbos-fips"
    exit 1
  '';
}
