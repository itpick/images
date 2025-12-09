{ pkgs, lib, ... }:

# TODO: Add tests for keda-fips image
{
  name = "keda-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keda-fips"
    exit 1
  '';
}
