{ pkgs, lib, ... }:

# TODO: Add tests for gitaly-fips image
{
  name = "gitaly-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitaly-fips"
    exit 1
  '';
}
