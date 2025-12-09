{ pkgs, lib, ... }:

# TODO: Add tests for metallb-speaker-fips image
{
  name = "metallb-speaker-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metallb-speaker-fips"
    exit 1
  '';
}
