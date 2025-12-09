{ pkgs, lib, ... }:

# TODO: Add tests for spamcheck-fips image
{
  name = "spamcheck-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spamcheck-fips"
    exit 1
  '';
}
