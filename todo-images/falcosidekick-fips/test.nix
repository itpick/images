{ pkgs, lib, ... }:

# TODO: Add tests for falcosidekick-fips image
{
  name = "falcosidekick-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falcosidekick-fips"
    exit 1
  '';
}
