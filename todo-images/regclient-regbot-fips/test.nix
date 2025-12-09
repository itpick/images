{ pkgs, lib, ... }:

# TODO: Add tests for regclient-regbot-fips image
{
  name = "regclient-regbot-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for regclient-regbot-fips"
    exit 1
  '';
}
