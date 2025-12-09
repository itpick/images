{ pkgs, lib, ... }:

# TODO: Add tests for promtail-fips image
{
  name = "promtail-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for promtail-fips"
    exit 1
  '';
}
