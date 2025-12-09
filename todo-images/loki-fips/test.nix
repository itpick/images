{ pkgs, lib, ... }:

# TODO: Add tests for loki-fips image
{
  name = "loki-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for loki-fips"
    exit 1
  '';
}
