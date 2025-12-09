{ pkgs, lib, ... }:

# TODO: Add tests for chainguard-base-fips image
{
  name = "chainguard-base-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chainguard-base-fips"
    exit 1
  '';
}
