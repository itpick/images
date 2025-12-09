{ pkgs, lib, ... }:

# TODO: Add tests for deck-fips image
{
  name = "deck-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for deck-fips"
    exit 1
  '';
}
