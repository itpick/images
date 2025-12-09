{ pkgs, lib, ... }:

# TODO: Add tests for loki-canary-fips image
{
  name = "loki-canary-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for loki-canary-fips"
    exit 1
  '';
}
