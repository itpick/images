{ pkgs, lib, ... }:

# TODO: Add tests for bash-fips image
{
  name = "bash-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for bash-fips"
    exit 1
  '';
}
